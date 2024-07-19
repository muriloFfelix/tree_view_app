import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_asset_repository.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_assets_usecase.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_asset_factory.dart';

class MockAssetRepository extends Mock implements IAssetRepository {}

void main() {
  late GetAssetsUsecase usecase;
  late IAssetRepository repository;
  late List<AssetEntity> entityList;

  setUp(() {
    repository = MockAssetRepository();
    usecase = GetAssetsUsecase(repository);
    entityList = [FakeAssetFactory.makeEntity()];
  });

  test('should return List<AssetEntity> from repository', () async {
    when(() => repository.getAssets(''))
        .thenAnswer((_) async => Right(entityList));

    final result = await usecase('');

    expect(result, Right(entityList));
    verify(() => repository.getAssets(''));
  });

  test('should return Failure from repository', () async {
    when(() => repository.getAssets(''))
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await usecase('');

    expect(result, const Left(ServerFailure()));
    verify(() => repository.getAssets(''));
  });
}
