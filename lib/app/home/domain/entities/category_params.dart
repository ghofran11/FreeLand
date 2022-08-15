import 'package:equatable/equatable.dart';

class CategoryParams extends Equatable {
  final int id;
  final String name;
  final int mainCategoryId;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  const CategoryParams({
    required this.id,
    required this.name,
    required this.mainCategoryId,
  });

  CategoryParams copyWith({int? id, String? name, int? mainCategoryId}) {
    return CategoryParams(
        id: id ?? this.id,
        name: name ?? this.name,
        mainCategoryId: mainCategoryId ?? this.mainCategoryId);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      "mainCategoryId": mainCategoryId,
    };
  }
}
