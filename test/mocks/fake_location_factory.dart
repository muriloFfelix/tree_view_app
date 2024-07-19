import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';

class FakeLocationFactory {
  static LocationEntity makeEntity() => const LocationEntity(
        id: 'id',
        name: 'name',
        parentId: 'parentId',
      );

  static LocationModel makeModel() => const LocationModel(
        id: 'id',
        name: 'name',
        parentId: 'parentId',
      );

  static Map<String, dynamic> makeJson() => {
        "id": "id",
        "name": "name",
        "parentId": "parentId",
      };
}
