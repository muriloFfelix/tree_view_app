import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/core/enum/sensor_type_enum.dart';
import 'package:tractian_mobile_app/core/enum/status_enum.dart';

class FakeAssetFactory {
  static AssetEntity makeEntity() => const AssetEntity(
        id: 'id',
        name: 'name',
        parentId: 'parentId',
        locationId: 'locationId',
        sensorType: SensorTypeEnum.energy,
        status: StatusEnum.alert,
      );

  static AssetModel makeModel() => const AssetModel(
        id: 'id',
        name: 'name',
        parentId: 'parentId',
        locationId: 'locationId',
        sensorType: SensorTypeEnum.energy,
        status: StatusEnum.alert,
      );

  static Map<String, dynamic> makeJson() => {
        "id": "id",
        "name": "name",
        "parentId": "parentId",
        "locationId": "locationId",
        "sensorType": "energy",
        "status": "alert"
      };
}
