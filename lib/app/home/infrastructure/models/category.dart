// To parse this JSON data, do
//

import 'package:meta/meta.dart';
import 'dart:convert';
List<CategoryDto2> categoriesFromJson(List<dynamic> data) {
  return data.map((e) => CategoryDto2.fromJson(e)).toList();
}
class CategoryDto2 {

  CategoryDto2({
    required this.id,
    required this.name,
    required this.mainCategoryId,
  });

  final String id;
  final String name;
  final String? mainCategoryId;

  CategoryDto2 copyWith({
    required String id,
    required String name,
    required String mainCategoryId,
  }) =>
      CategoryDto2(
        id: id,
        name: name ,
        mainCategoryId: mainCategoryId ,
      );



  String toJson() => json.encode(toMap());

  factory CategoryDto2.fromJson(Map<String, dynamic> json) => CategoryDto2(
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
