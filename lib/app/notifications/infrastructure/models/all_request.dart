// To parse this JSON data, do
//
//     final allRequest = allRequestFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<AllRequest> RequestFromJson(List<dynamic> data) {
  return data.map((e) => AllRequest.fromJson(e)).toList();
}
class AllRequest {
  AllRequest({
    required this.id,
    required this.name,
    required this.imagePath,
  });

  final String id;
  final String name;
  final String imagePath;

  AllRequest copyWith({
    String? id,
    String? name,
    String? imagePath,
  }) =>
      AllRequest(
        id: id ?? this.id,
        name: name ?? this.name,
        imagePath: imagePath ?? this.imagePath,
      );

  factory AllRequest.fromJson(String str) => AllRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllRequest.fromMap(Map<String, dynamic> json) => AllRequest(
    id: json["id"],
    name: json["name"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "imagePath": imagePath,
  };
}
