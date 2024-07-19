import 'package:flutter_test/flutter_test.dart';
import 'package:tractian_mobile_app/app/data/models/company_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';

import '../../../mocks/fake_company_factory.dart';

void main() {
  final model = FakeCompanyFactory.makeModel();
  final json = FakeCompanyFactory.makeJson();

  test('should be subclass of CompanyEntity', () {
    expect(model, isA<CompanyEntity>());
  });

  test('should return a valid model', () {
    final result = CompanyModel.fromJson(json);
    expect(result, model);
  });
}
