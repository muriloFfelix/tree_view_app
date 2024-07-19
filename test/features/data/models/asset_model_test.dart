import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';

import '../../../mocks/fake_asset_factory.dart';

void main() {
  final model = FakeAssetFactory.makeModel();
  final json = FakeAssetFactory.makeJson();

  test('should be subclass of AssetEntity', () {
    expect(model, isA<AssetEntity>());
  });

  test('should return a valid model', () {
    final result = AssetModel.fromJson(json);
    expect(result, model);
  });
}
