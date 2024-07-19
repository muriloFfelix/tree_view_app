import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_asset_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/app/data/repositories/asset_repository.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_asset_factory.dart';

class MockAssetDatasource extends Mock implements IAssetDatasource {}

void main() {
  late AssetRepository repository;
  late IAssetDatasource datasource;

  late List<AssetModel> modelsList;
  late List<AssetEntity> entityList;

  setUp(() {
    datasource = MockAssetDatasource();
    repository = AssetRepository(datasource);

    modelsList = [FakeAssetFactory.makeModel()];
    entityList = modelsList.map((e) => AssetEntity.fromModel(e)).toList();
  });

  test('getAssets should return List<AssetEntity>', () async {
    when(() => datasource.getAssets(''))
        .thenAnswer((_) async => Right(modelsList));

    final result = await repository.getAssets('');

    result.fold(
      (failure) => fail('Expected a successful result, but got failure'),
      (actualList) {
        expect(actualList.length, entityList.length);
        for (int i = 0; i < actualList.length; i++) {
          expect(actualList[i], equals(entityList[i]));
        }
      },
    );

    verify(() => datasource.getAssets(''));
  });

  test('getAssets should return ServerFailure()', () async {
    when(() => datasource.getAssets(''))
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await repository.getAssets('');

    expect(result, const Left(ServerFailure()));
    verify(() => datasource.getAssets(''));
  });
}
