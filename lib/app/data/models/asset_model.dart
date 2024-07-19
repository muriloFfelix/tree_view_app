import 'package:json_annotation/json_annotation.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/core/enum/sensor_type_enum.dart';
import 'package:tractian_mobile_app/core/enum/status_enum.dart';

part 'asset_model.g.dart';

@JsonSerializable()
class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    super.locationId,
    super.parentId,
    super.sensorType,
    super.status,
  });

  Map<String, dynamic> toJson() => _$AssetModelToJson(this);

  factory AssetModel.fromJson(Map<String, dynamic> map) =>
      _$AssetModelFromJson(map);
}
