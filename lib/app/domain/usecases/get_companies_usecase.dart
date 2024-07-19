import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_company_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';
import 'package:tractian_mobile_app/core/abstracts/usecase.dart';

class GetCompaniesUsecase extends Usecase<List<CompanyEntity>, NoParams> {
  final ICompanyRepository companyRepository;

  GetCompaniesUsecase(this.companyRepository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(NoParams params) {
    return companyRepository.getCompanies();
  }
}
