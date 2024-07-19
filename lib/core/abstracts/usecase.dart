import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams {}
