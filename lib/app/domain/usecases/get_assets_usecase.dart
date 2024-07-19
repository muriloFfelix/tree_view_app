import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_asset_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';
import 'package:tractian_mobile_app/core/abstracts/usecase.dart';

class GetAssetsUsecase extends Usecase<List<AssetEntity>, String> {
  final IAssetRepository assetRepository;

  GetAssetsUsecase(this.assetRepository);

  @override
  Future<Either<Failure, List<AssetEntity>>> call(String params) {
    return assetRepository.getAssets(params);
  }
}
