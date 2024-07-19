import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class ILocationRepository {
  Future<Either<Failure, List<LocationEntity>>> getLocations(String companyId);
}
