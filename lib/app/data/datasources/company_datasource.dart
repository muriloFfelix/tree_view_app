import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/data/datasources/endpoints/base_endpoints.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_company_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/company_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class CompanyDatasource implements ICompanyDatasource {
  final GetConnect httpClient;

  CompanyDatasource(this.httpClient);

  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() async {
    final Response response =
        await httpClient.get(BaseEndpoints.getCompanies());

    if (response.isOk) {
      return Right((response.body as List)
          .map<CompanyModel>((e) => CompanyModel.fromJson(e))
          .toList());
    } else {
      return const Left(ServerFailure());
    }
  }
}
