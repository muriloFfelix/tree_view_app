import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/core/abstracts/basic_entity.dart';

class LocationEntity extends BasicEntity {
  const LocationEntity({
    required super.id,
    required super.name,
    super.parentId,
  });

  factory LocationEntity.fromModel(LocationModel model) => LocationEntity(
        id: model.id,
        name: model.name,
        parentId: model.parentId,
      );
}
