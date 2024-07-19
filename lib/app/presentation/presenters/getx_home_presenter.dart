import 'package:get/get.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';
import 'package:tractian_mobile_app/app/domain/usecases/get_companies_usecase.dart';
import 'package:tractian_mobile_app/core/abstracts/usecase.dart';

class GetxHomePresenter extends GetxController {
  final GetCompaniesUsecase getCompaniesUsecase;

  GetxHomePresenter(
    this.getCompaniesUsecase,
  );

  final RxList<CompanyEntity> _companiesList = RxList<CompanyEntity>([]);
  List<CompanyEntity> get companiesList => _companiesList;
  set companiesList(List<CompanyEntity> value) => _companiesList.value = value;

  @override
  void onInit() async {
    super.onInit();

    await getCompanies();
  }

  getCompanies() async {
    final result = await getCompaniesUsecase(NoParams());

    result.match(
      (failure) => throw result,
      (success) => companiesList = success,
    );
  }
}
