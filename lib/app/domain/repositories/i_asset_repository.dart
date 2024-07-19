import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class IAssetRepository {
  Future<Either<Failure, List<AssetEntity>>> getAssets(String companyId);
}
