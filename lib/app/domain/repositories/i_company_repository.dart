import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class ICompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> getCompanies();
}
