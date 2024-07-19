// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => AssetModel(
      id: json['id'] as String,
      name: json['name'] as String,
      locationId: json['locationId'] as String?,
      parentId: json['parentId'] as String?,
      sensorType:
          $enumDecodeNullable(_$SensorTypeEnumEnumMap, json['sensorType']),
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'parentId': instance.parentId,
      'locationId': instance.locationId,
      'sensorType': _$SensorTypeEnumEnumMap[instance.sensorType],
      'status': _$StatusEnumEnumMap[instance.status],
    };

const _$SensorTypeEnumEnumMap = {
  SensorTypeEnum.energy: 'energy',
  SensorTypeEnum.vibration: 'vibration',
};

const _$StatusEnumEnumMap = {
  StatusEnum.operating: 'operating',
  StatusEnum.alert: 'alert',
};
