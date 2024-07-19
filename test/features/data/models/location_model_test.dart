import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';

import '../../../mocks/fake_location_factory.dart';

void main() {
  final model = FakeLocationFactory.makeModel();
  final json = FakeLocationFactory.makeJson();

  test('should be subclass of LocationEntity', () {
    expect(model, isA<LocationEntity>());
  });

  test('should return a valid model', () {
    final result = LocationModel.fromJson(json);
    expect(result, model);
  });
}
