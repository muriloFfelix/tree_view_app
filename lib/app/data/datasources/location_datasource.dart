import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/data/datasources/endpoints/base_endpoints.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_location_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class LocationDatasource implements ILocationDatasource {
  final GetConnect httpClient;

  LocationDatasource(this.httpClient);

  @override
  Future<Either<Failure, List<LocationModel>>> getLocations(
      String companyId) async {
    final Response response =
        await httpClient.get(BaseEndpoints.getLocations(companyId));

    if (response.isOk) {
      return Right((response.body as List)
          .map<LocationModel>((e) => LocationModel.fromJson(e))
          .toList());
    } else {
      return const Left(ServerFailure());
    }
  }
}
