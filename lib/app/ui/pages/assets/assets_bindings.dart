import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/data/datasources/asset_datasource.dart';
import 'package:tractian_mobile_app/app/data/datasources/location_datasource.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_asset_datasource.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_location_datasource.dart';
import 'package:tractian_mobile_app/app/data/repositories/asset_repository.dart';
import 'package:tractian_mobile_app/app/data/repositories/location_repository.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_asset_repository.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_location_repository.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_mobile_app/app/presentation/presenters/getx_assets_presenter.dart';

class AssetsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocationRepository>(() => LocationRepository(Get.find()));
    Get.lazyPut<ILocationDatasource>(() => LocationDatasource(GetConnect()));

    Get.lazyPut<IAssetRepository>(() => AssetRepository(Get.find()));
    Get.lazyPut<IAssetDatasource>(() => AssetDatasource(GetConnect()));

    Get.lazyPut(() => GetLocationsUsecase(Get.find()));
    Get.lazyPut(() => GetAssetsUsecase(Get.find()));

    Get.lazyPut(() => GetxAssetsPresenter(
          Get.find(),
          Get.find(),
        ));
  }
}
