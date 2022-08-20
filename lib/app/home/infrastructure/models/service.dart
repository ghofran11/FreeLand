// To parse this JSON data, do
//
//     final serviceDto = serviceDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<ServiceDto> serviceFromJson(List<dynamic> data) {
  return data.map((e) => ServiceDto.fromMap(e)).toList();
}
class ServiceDto {
  ServiceDto({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.nameOwner,
    required this.description,
    required this.evalution,
    required this.serviceType,
    required this.minPrice,
    required this.maxPrice,
  });

  final String id;
  final String name;
  final String ownerId;
  final String nameOwner;
  final String description;
  final int? evalution;
  final int serviceType;
  final int minPrice;
  final int maxPrice;

  ServiceDto copyWith({
    required String id,
    required String name,
    required String ownerId,
    required String nameOwner,
    required String description,
    required int evalution,
    required int serviceType,
    required int minPrice,
    required int maxPrice,
  }) =>
      ServiceDto(
        id: id,
        name: name,
        ownerId: ownerId,
        nameOwner: nameOwner,
        description: description,
        evalution: evalution,
        serviceType: serviceType,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );

  factory ServiceDto.fromJson(String str) => ServiceDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ServiceDto.fromMap(Map<String, dynamic> json) => ServiceDto(
    id: json["id"],
    name: json["name"],
    ownerId: json["ownerId"],
    nameOwner: json["nameOwner"],
    description: json["description"],
    evalution: json["evalution"],
    serviceType: json["serviceType"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "ownerId": ownerId,
    "nameOwner": nameOwner,
    "description": description,
    "evalution": evalution,
    "serviceType": serviceType,
    "minPrice": minPrice,
    "maxPrice": maxPrice,
  };
}
