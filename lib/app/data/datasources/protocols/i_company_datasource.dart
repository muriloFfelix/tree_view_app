import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/models/company_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class ICompanyDatasource {
  Future<Either<Failure, List<CompanyModel>>> getCompanies();
}
