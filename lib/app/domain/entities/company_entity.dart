import 'package:equatable/equatable.dart';
import 'package:tractian_mobile_app/app/data/models/company_model.dart';

class CompanyEntity extends Equatable {
  final String id;
  final String name;

  const CompanyEntity({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  factory CompanyEntity.fromModel(CompanyModel model) => CompanyEntity(
        id: model.id,
        name: model.name,
      );
}
