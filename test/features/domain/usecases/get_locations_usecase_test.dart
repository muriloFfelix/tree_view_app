import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_location_repository.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_locations_usecase.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_location_factory.dart';

class MockLocationRepository extends Mock implements ILocationRepository {}

void main() {
  late GetLocationsUsecase usecase;
  late ILocationRepository repository;
  late List<LocationEntity> entityList;

  setUp(() {
    repository = MockLocationRepository();
    usecase = GetLocationsUsecase(repository);
    entityList = [FakeLocationFactory.makeEntity()];
  });

  test('should return List<LocationEntity> from repository', () async {
    when(() => repository.getLocations(''))
        .thenAnswer((_) async => Right(entityList));

    final result = await usecase('');

    expect(result, Right(entityList));
    verify(() => repository.getLocations(''));
  });

  test('should return Failure from repository', () async {
    when(() => repository.getLocations(''))
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await usecase('');

    expect(result, const Left(ServerFailure()));
    verify(() => repository.getLocations(''));
  });
}
