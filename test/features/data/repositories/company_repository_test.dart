import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_company_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/company_model.dart';
import 'package:tractian_mobile_app/app/data/repositories/company_repository.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

import '../../../mocks/fake_company_factory.dart';

class MockCompanyDatasource extends Mock implements ICompanyDatasource {}

void main() {
  late CompanyRepository repository;
  late ICompanyDatasource datasource;

  late List<CompanyModel> modelsList;
  late List<CompanyEntity> entityList;

  setUp(() {
    datasource = MockCompanyDatasource();
    repository = CompanyRepository(datasource);

    modelsList = [FakeCompanyFactory.makeModel()];
    entityList = modelsList.map((e) => CompanyEntity.fromModel(e)).toList();
  });

  test('getCompanies should return List<CompanyEntity>', () async {
    when(() => datasource.getCompanies())
        .thenAnswer((_) async => Right(modelsList));

    final result = await repository.getCompanies();

    result.fold(
      (failure) => fail('Expected a successful result, but got failure'),
      (actualList) {
        expect(actualList.length, entityList.length);
        for (int i = 0; i < actualList.length; i++) {
          expect(actualList[i], equals(entityList[i]));
        }
      },
    );

    verify(() => datasource.getCompanies());
  });

  test('getCompanies should return ServerFailure()', () async {
    when(() => datasource.getCompanies())
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await repository.getCompanies();

    expect(result, const Left(ServerFailure()));
    verify(() => datasource.getCompanies());
  });
}
