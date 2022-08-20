// To parse this JSON data, do
//
//     final addProjectParams = addProjectParamsFromMap(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freeland/common/utils/image.dart';

class AddProjectParams {
  AddProjectParams({
    required this.name,
    required this.deadLine,
    required this.description,
    required this.minPrice,
    required this.maxPrice,
    required this.categoriesIds,
    required this.image,
  });

  final String name;
  final DateTime deadLine;
  final String description;
  final int minPrice;
  final int maxPrice;
  final List<String> categoriesIds;
  final File? image;

  AddProjectParams copyWith({
    String? name,
    final DateTime? deadLine,
    String? description,
    int? minPrice,
    int? maxPrice,
    List<String>? categoriesIds,
    File? image,
  }) =>
      AddProjectParams(
        name: name ?? this.name,
        deadLine: deadLine ?? this.deadLine,
        description: description ?? this.description,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        categoriesIds: categoriesIds ?? this.categoriesIds,
        image: image ?? this.image,
      );

  // factory AddProjectParams.fromJson(String str) =>
  //     AddProjectParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // factory AddProjectParams.fromMap(Map<String, dynamic> json) =>
  //     AddProjectParams(
  //       id: json["id"],
  //       name: json["name"],
  //       deadLine: json["deadLine"],
  //       ownerId: json["ownerId"],
  //       nameOwner: json["nameOwner"],
  //       description: json["description"],
  //       evalution: json["evalution"],
  //       serviceType: json["serviceType"],
  //       minPrice: json["minPrice"],
  //       maxPrice: json["maxPrice"],
  //       documentDto: DocumentDto.fromMap(json["documentDto"]),
  //       image: js,
  //       contractDto: List<ContractDto>.from(
  //           json["contractDto"].map((x) => ContractDto.fromMap(x))),
  //     );

  Map<String, dynamic> toMap() => {
        "name": name,
        "description": description,
        "minPrice": minPrice,
        "maxPrice": maxPrice,
        'categoryIds': categoriesIds
        // "contractDto": List<dynamic>.from(contractDto!.map((x) => x.toMap())),
      };

  Future<FormData> formData() async => FormData.fromMap(toMap()
    ..addAll({
      "files": image != null
          ? await MultipartFile.fromFile(
              (await compressImages([image!])).first!.path)
          : null,
    }));
}

class ContractDto {
  ContractDto({
    required this.id,
    required this.description,
    required this.deadLine,
    required this.deadLineSupport,
    required this.totalPrice,
    required this.contractStatus,
    required this.partDtos,
  });

  final String id;
  final String description;
  final DateTime deadLine;
  final DateTime deadLineSupport;
  final int totalPrice;
  final int contractStatus;
  final List<PartDto> partDtos;

  ContractDto copyWith({
    String? id,
    String? description,
    DateTime? deadLine,
    DateTime? deadLineSupport,
    int? totalPrice,
    int? contractStatus,
    List<PartDto>? partDtos,
  }) =>
      ContractDto(
        id: id ?? this.id,
        description: description ?? this.description,
        deadLine: deadLine ?? this.deadLine,
        deadLineSupport: deadLineSupport ?? this.deadLineSupport,
        totalPrice: totalPrice ?? this.totalPrice,
        contractStatus: contractStatus ?? this.contractStatus,
        partDtos: partDtos ?? this.partDtos,
      );

  factory ContractDto.fromJson(String str) =>
      ContractDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContractDto.fromMap(Map<String, dynamic> json) => ContractDto(
        id: json["id"],
        description: json["description"],
        deadLine: DateTime.parse(json["deadLine"]),
        deadLineSupport: DateTime.parse(json["deadLineSupport"]),
        totalPrice: json["totalPrice"],
        contractStatus: json["contractStatus"],
        partDtos:
            List<PartDto>.from(json["partDtos"].map((x) => PartDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "deadLine": deadLine.toIso8601String(),
        "deadLineSupport": deadLineSupport.toIso8601String(),
        "totalPrice": totalPrice,
        "contractStatus": contractStatus,
        "partDtos": List<dynamic>.from(partDtos.map((x) => x.toMap())),
      };
}

class PartDto {
  PartDto({
    required this.id,
    required this.description,
    required this.startDate,
    required this.deadLine,
    required this.price,
  });

  final String id;
  final String description;
  final DateTime startDate;
  final DateTime deadLine;
  final int price;

  PartDto copyWith({
    String? id,
    String? description,
    DateTime? startDate,
    DateTime? deadLine,
    int? price,
  }) =>
      PartDto(
        id: id ?? this.id,
        description: description ?? this.description,
        startDate: startDate ?? this.startDate,
        deadLine: deadLine ?? this.deadLine,
        price: price ?? this.price,
      );

  factory PartDto.fromJson(String str) => PartDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PartDto.fromMap(Map<String, dynamic> json) => PartDto(
        id: json["id"],
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        deadLine: DateTime.parse(json["deadLine"]),
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "description": description,
        "startDate": startDate.toIso8601String(),
        "deadLine": deadLine.toIso8601String(),
        "price": price,
      };
}

class DocumentDto {
  DocumentDto({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
  });

  final String id;
  final String name;
  final String path;
  final int type;

  DocumentDto copyWith({
    String? id,
    String? name,
    String? path,
    int? type,
  }) =>
      DocumentDto(
        id: id ?? this.id,
        name: name ?? this.name,
        path: path ?? this.path,
        type: type ?? this.type,
      );

  factory DocumentDto.fromJson(String str) =>
      DocumentDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocumentDto.fromMap(Map<String, dynamic> json) => DocumentDto(
        id: json["id"],
        name: json["name"],
        path: json["path"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "path": path,
        "type": type,
      };
}
