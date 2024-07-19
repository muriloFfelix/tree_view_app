import 'package:tractian_mobile_app/app/data/models/company_model.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';

class FakeCompanyFactory {
  static CompanyEntity makeEntity() => const CompanyEntity(
        id: 'id',
        name: 'name',
      );

  static CompanyModel makeModel() => const CompanyModel(
        id: 'id',
        name: 'name',
      );

  static Map<String, dynamic> makeJson() => {
        "id": "id",
        "name": "name",
      };
}
