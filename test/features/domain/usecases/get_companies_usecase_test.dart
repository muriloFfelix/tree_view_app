import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_company_repository.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';
import 'package:tractian_mobile_app/core/abstracts/usecase.dart';

import '../../../mocks/fake_company_factory.dart';

class MockCompanyRepository extends Mock implements ICompanyRepository {}

void main() {
  late GetCompaniesUsecase usecase;
  late ICompanyRepository repository;
  late List<CompanyEntity> entityList;

  setUp(() {
    repository = MockCompanyRepository();
    usecase = GetCompaniesUsecase(repository);
    entityList = [FakeCompanyFactory.makeEntity()];
  });

  test('should return List<CompanyEntity> from repository', () async {
    when(() => repository.getCompanies())
        .thenAnswer((_) async => Right(entityList));

    final result = await usecase(NoParams());

    expect(result, Right(entityList));
    verify(() => repository.getCompanies());
  });

  test('should return Failure from repository', () async {
    when(() => repository.getCompanies())
        .thenAnswer((_) async => const Left(ServerFailure()));

    final result = await usecase(NoParams());

    expect(result, const Left(ServerFailure()));
    verify(() => repository.getCompanies());
  });
}
