import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_location_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/app/data/repositories/location_repository.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_location_factory.dart';

class MockLocationDatasource extends Mock implements ILocationDatasource {}

void main() {
  late LocationRepository repository;
  late ILocationDatasource datasource;

  late List<LocationModel> modelsList;
  late List<LocationEntity> entityList;

  setUp(() {
    datasource = MockLocationDatasource();
    repository = LocationRepository(datasource);

    modelsList = [FakeLocationFactory.makeModel()];
    entityList = modelsList.map((e) => LocationEntity.fromModel(e)).toList();
  });

  test('getLocations should return List<LocationEntity>', () async {
    when(() => datasource.getLocations(''))
        .thenAnswer((_) async => Right(modelsList));

    final result = await repository.getLocations('');

    result.fold(
      (failure) => fail('Expected a successful result, but got failure'),
      (actualList) {
        expect(actualList.length, entityList.length);
        for (int i = 0; i < actualList.length; i++) {
          expect(actualList[i], equals(entityList[i]));
        }
      },
    );

    verify(() => datasource.getLocations(''));
  });

  test('getLocations should return ServerFailure()', () async {
    when(() => datasource.getLocations(''))
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await repository.getLocations('');

    expect(result, const Left(ServerFailure()));
    verify(() => datasource.getLocations(''));
  });
}
