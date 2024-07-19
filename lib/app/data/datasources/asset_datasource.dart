import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/data/datasources/endpoints/base_endpoints.dart';
import 'package:tractian_mobile_app/app/data/datasources/protocols/i_asset_datasource.dart';
import 'package:tractian_mobile_app/app/data/models/asset_model.dart';
import 'package:tractian_mobile_app/core/abstracts/failure.dart';

class AssetDatasource implements IAssetDatasource {
  final GetConnect httpClient;

  AssetDatasource(this.httpClient);

  @override
  Future<Either<Failure, List<AssetModel>>> getAssets(String companyId) async {
    final Response response =
        await httpClient.get(BaseEndpoints.getAssets(companyId));

    if (response.isOk) {
      return Right((response.body as List)
          .map<AssetModel>((e) => AssetModel.fromJson(e))
          .toList());
    } else {
      return const Left(ServerFailure());
    }
  }
}
