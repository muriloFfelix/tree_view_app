import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_location_datasource.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_location_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class LocationRepository implements ILocationRepository {
  final ILocationDatasource datasource;
  LocationRepository(this.datasource);

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations(
      String companyId) async {
    final result = await datasource.getLocations(companyId);

    return result.match(
        (failure) => Left(failure),
        (success) => Right(success
            .map(
              (e) => LocationEntity.fromModel(e),
            )
            .toList()));
  }
}
