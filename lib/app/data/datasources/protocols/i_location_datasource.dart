import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/models/location_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class ILocationDatasource {
  Future<Either<Failure, List<LocationModel>>> getLocations(String companyId);
}
