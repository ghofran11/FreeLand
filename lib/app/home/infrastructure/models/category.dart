// To parse this JSON data, do
//
//     final categoryDto = categoryDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<CategoryDto> categoriesFromJson(List<dynamic> data) {
  return data.map((e) => CategoryDto.fromJson(e)).toList();
}
class CategoryDto {

  CategoryDto({
    required this.id,
    required this.name,
    required this.mainCategoryId,
  });

  final String id;
  final String name;
  final String? mainCategoryId;

  CategoryDto copyWith({
    required String id,
    required String name,
    required String mainCategoryId,
  }) =>
      CategoryDto(
        id: id,
        name: name ,
        mainCategoryId: mainCategoryId ,
      );



  String toJson() => json.encode(toMap());

  factory CategoryDto.fromJson(Map<String, dynamic> json) => CategoryDto(
    id: json["id"],
    name: json["name"],
    mainCategoryId: json["mainCategoryId"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "mainCategoryId": mainCategoryId,
  };
}
