import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_locations_usecase.dart';
import 'package:collection/collection.dart';
import 'package:tractian_mobile_app/core/abstracts/basic_entity.dart';
import 'package:tractian_mobile_app/core/enum/sensor_type_enum.dart';
import 'package:tractian_mobile_app/core/enum/status_enum.dart';

class AssetsPageParams {
  String companyId;

  AssetsPageParams({required this.companyId});
}

class GetxAssetsController extends GetxController {
  final GetLocationsUsecase getLocationsUsecase;
  final GetAssetsUsecase getAssetsUsecase;

  GetxAssetsController(
    this.getLocationsUsecase,
    this.getAssetsUsecase,
  );

  late final String companyId;

  late final Map<String, List<BasicEntity>> itemsGroups;

  final List<BasicEntity> itemsFlatTree = [];

  final List<String> filterIds = [];

  final List<String> closedIds = [];

  final inputController = TextEditingController();

  // #region observables

  final RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  set isLoading(bool value) => _isLoading.value = value;

  final RxBool _filterByEnergy = false.obs;
  bool get filterByEnergy => _filterByEnergy.value;
  set filterByEnergy(bool value) => _filterByEnergy.value = value;

  final RxBool _filterByAlert = false.obs;
  bool get filterByAlert => _filterByAlert.value;
  set filterByAlert(bool value) => _filterByAlert.value = value;

  final RxList<LocationEntity> _locationsList = RxList<LocationEntity>([]);
  List<LocationEntity> get locationsList => _locationsList;
  set locationsList(List<LocationEntity> value) => _locationsList.value = value;

  final RxList<AssetEntity> _assetsList = RxList<AssetEntity>([]);
  List<AssetEntity> get assetsList => _assetsList;
  set assetsList(List<AssetEntity> value) => _assetsList.value = value;

  // #endregion

  // #region initialization methods

  @override
  void onReady() async {
    final AssetsPageParams? args = Get.arguments;

    if (args == null) {
      Get.back();
      Get.showSnackbar(
        const GetSnackBar(
          duration: Duration(milliseconds: 1500),
          backgroundColor: Colors.redAccent,
          title: 'ERRO!',
          message: 'Não foi possível identificar o ID fornecido',
        ),
      );
      return;
    }
    companyId = args.companyId;

    await _getLocations();
    await _getAssets();

    _delegateGroups();
  }

  _getLocations() async {
    isLoading = true;

    final result = await getLocationsUsecase(companyId);

    result.match(
      (failure) => throw result,
      (success) => locationsList = success,
    );

    isLoading = false;
  }

  _getAssets() async {
    isLoading = true;

    final result = await getAssetsUsecase(companyId);

    result.match(
      (failure) => throw result,
      (success) => assetsList = success,
    );

    isLoading = false;
  }

  _delegateGroups() {
    final List<BasicEntity> items = [...locationsList, ...assetsList];

    itemsGroups = groupBy(items, (i) {
      return i is AssetEntity
          ? i.parentId ?? i.locationId.toString()
          : i.parentId.toString();
    });
  }

  // #endregion

  // #region pulic methods

  List<BasicEntity> getItemsGroup(String? parentId) {
    if (filterIds.isEmpty) {
      return itemsGroups[parentId.toString()] ?? [];
    } else {
      return itemsGroups[parentId.toString()]
              ?.filter((e) => filterIds.contains(e.id))
              .toList() ??
          [];
    }
  }

  List<BasicEntity> getTreeList(String? parentId) {
    for (var item in getItemsGroup(parentId.toString())) {
      if (filterIds.isEmpty || filterIds.contains(item.id)) {
        itemsFlatTree.add(item);
        if (!closedIds.contains(item.id)) {
          getTreeList(item.id);
        }
      }
    }
    return itemsFlatTree;
  }

  getFilterIds() async {
    isLoading = true;
    itemsFlatTree.clear();
    closedIds.clear();

    if (!filterByEnergy && !filterByAlert && inputController.text.isEmpty) {
      filterIds.clear();
      isLoading = false;
      return;
    }

    List<String> ids = [];

    for (final asset in assetsList) {
      if (_applyFilters(asset)) {
        ids = (_getStackAsset(asset, [...ids]));
      }
    }

    for (final location in locationsList) {
      if (_applyFilters(location)) {
        ids = (_getStackLocation(location, [...ids]));
      }
    }

    isLoading = false;

    filterIds.clear();
    filterIds.addAll(ids.isEmpty ? [''] : ids);
  }

  bool handleTreeItemTap(bool value, String entityId) {
    isLoading = true;
    itemsFlatTree.clear();
    value ? closedIds.add(entityId) : closedIds.remove(entityId);
    isLoading = false;
    return value;
  }

  // #endregion

  // #region private methods

  bool _applyFilters(BasicEntity entity) {
    if (filterByEnergy &&
        (entity is! AssetEntity ||
            entity.sensorType != SensorTypeEnum.energy)) {
      return false;
    }

    if (filterByAlert &&
        (entity is! AssetEntity || entity.status != StatusEnum.alert)) {
      return false;
    }

    if (!entity.name
        .toLowerCase()
        .contains(inputController.text.toLowerCase())) {
      return false;
    }
    return true;
  }

  List<String> _getStackAsset(AssetEntity asset, List<String> ids) {
    ids.addIf(!ids.contains(asset.id), asset.id);

    if (asset.parentId != null && !ids.contains(asset.parentId)) {
      final parent = assetsList.firstWhere((e) => e.id == asset.parentId);
      return _getStackAsset(parent, ids);
    } else if (asset.locationId != null && !ids.contains(asset.locationId)) {
      final parent = locationsList.firstWhere((e) => e.id == asset.locationId);
      return _getStackLocation(parent, ids);
    }

    return ids;
  }

  List<String> _getStackLocation(LocationEntity location, List<String> ids) {
    ids.addIf(!ids.contains(location.id), location.id);

    if (location.parentId != null && !ids.contains(location.parentId)) {
      final parent = locationsList.firstWhere((e) => e.id == location.parentId);
      return _getStackLocation(parent, ids);
    }

    return ids;
  }

  // #endregion
}
