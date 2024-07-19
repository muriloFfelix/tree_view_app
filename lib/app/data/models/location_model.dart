import 'package:json_annotation/json_annotation.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel({
    required super.id,
    required super.name,
    super.parentId,
  });

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  factory LocationModel.fromJson(Map<String, dynamic> map) =>
      _$LocationModelFromJson(map);
}
