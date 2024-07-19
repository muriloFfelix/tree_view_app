import 'package:fpdart/fpdart.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_asset_datasource.dart';
import 'package:tractian_mobile_app/app/domain/entities/asset_entity.dart';
import 'package:tractian_mobile_app/app/domain/repositories/i_asset_repository.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class AssetRepository implements IAssetRepository {
  final IAssetDatasource datasource;
  AssetRepository(this.datasource);

  @override
  Future<Either<Failure, List<AssetEntity>>> getAssets(String companyId) async {
    final result = await datasource.getAssets(companyId);

    return result.match(
        (failure) => Left(failure),
        (success) => Right(success
            .map(
              (e) => AssetEntity.fromModel(e),
            )
            .toList()));
  }
}
