import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_company_datasource.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_company_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class CompanyRepository implements ICompanyRepository {
  final ICompanyDatasource datasource;
  CompanyRepository(this.datasource);

  @override
  Future<Either<Failure, List<CompanyEntity>>> getCompanies() async {
    final result = await datasource.getCompanies();

    return result.match(
        (failure) => Left(failure),
        (success) => Right(success
            .map(
              (e) => CompanyEntity.fromModel(e),
            )
            .toList()));
  }
}
