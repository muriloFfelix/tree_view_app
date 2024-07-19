import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/location_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_location_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';
import 'package:tractian_mobile_app/core/abstracts/usecase.dart';

class GetLocationsUsecase extends Usecase<List<LocationEntity>, String> {
  final ILocationRepository locationRepository;

  GetLocationsUsecase(this.locationRepository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call(String params) {
    return locationRepository.getLocations(params);
  }
}
