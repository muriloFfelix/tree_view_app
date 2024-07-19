import 'package:equatable/equatable.dart';

abstract class BasicEntity extends Equatable {
  final String id;
  final String name;
  final String? parentId;

  const BasicEntity({
    required this.id,
    required this.name,
    this.parentId,
  });

  @override
  List<Object?> get props => [id, name, parentId];
}
