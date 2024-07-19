import 'package:json_annotation/json_annotation.dart';
import 'package:tractian_mobile_app/app/domain/entities/company_entity.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
  });

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);

  factory CompanyModel.fromJson(Map<String, dynamic> map) =>
      _$CompanyModelFromJson(map);
}
