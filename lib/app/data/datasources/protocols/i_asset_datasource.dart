import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

abstract class IAssetDatasource {
  Future<Either<Failure, List<AssetModel>>> getAssets(String companyId);
}
