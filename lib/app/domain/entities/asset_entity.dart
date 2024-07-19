import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/core/abstracts/basic_entity.dart';
import 'package:tractian_mobile_app/core/enum/sensor_type_enum.dart';
import 'package:tractian_mobile_app/core/enum/status_enum.dart';

class AssetEntity extends BasicEntity {
  final String? locationId;
  final SensorTypeEnum? sensorType;
  final StatusEnum? status;

  const AssetEntity({
    required super.id,
    required super.name,
    this.locationId,
    super.parentId,
    this.sensorType,
    this.status,
  });

  factory AssetEntity.fromModel(AssetModel model) => AssetEntity(
        id: model.id,
        name: model.name,
        locationId: model.locationId,
        parentId: model.parentId,
        sensorType: model.sensorType,
        status: model.status,
      );
}
