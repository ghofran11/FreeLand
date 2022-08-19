// To parse this JSON data, do
//
//     final addProjectParams = addProjectParamsFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AddProjectParams {
  AddProjectParams({
     this.id,
   required this.name,
     this.ownerId,
    required this.deadLine,
    this.nameOwner,
    required this.description,
    this.evalution,
     this.serviceType,
    required this.minPrice,
    required this.maxPrice,
     this.documentDto,
     this.contractDto,
  });

  final String? id;
  final String name;
  final DateTime deadLine;
  final String? ownerId;
  final String? nameOwner;
  final String description;
  final int? evalution;
  final int? serviceType;
  final int minPrice;
  final int maxPrice;
  final DocumentDto? documentDto;
  final List<ContractDto>? contractDto;

  AddProjectParams copyWith({
    String? id,
    String? name,
    String? ownerId,
    final DateTime? deadLine,
    String? nameOwner,
    String? description,
    int? evalution,
    int? serviceType,
    int? minPrice,
    int? maxPrice,
    DocumentDto? documentDto,
    List<ContractDto>? contractDto,
  }) =>
      AddProjectParams(
        id: id ?? this.id,
        name: name ?? this.name,
        ownerId: ownerId ?? this.ownerId,
        deadLine: deadLine ?? this.deadLine,
        nameOwner: nameOwner ?? this.nameOwner,
        description: description ?? this.description,
        evalution: evalution ?? this.evalution,
        serviceType: serviceType ?? this.serviceType,
        minPrice: minPrice ?? this.minPrice,
        maxPrice: maxPrice ?? this.maxPrice,
        documentDto: documentDto ?? this.documentDto,
        contractDto: contractDto ?? this.contractDto,
      );

  factory AddProjectParams.fromJson(String str) => AddProjectParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddProjectParams.fromMap(Map<String, dynamic> json) => AddProjectParams(
    id: json["id"],
    name: json["name"],
    deadLine: json["deadLine"] ,
    ownerId: json["ownerId"],
    nameOwner: json["nameOwner"],
    description: json["description"],
    evalution: json["evalution"],
    serviceType: json["serviceType"],
    minPrice: json["minPrice"],
    maxPrice: json["maxPrice"],
    documentDto: DocumentDto.fromMap(json["documentDto"]),
    contractDto: List<ContractDto>.from(json["contractDto"].map((x) => ContractDto.fromMap(x))),
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
    "documentDto": documentDto?.toMap(),
   // "contractDto": List<dynamic>.from(contractDto!.map((x) => x.toMap())),
  };
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

  factory ContractDto.fromJson(String str) => ContractDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContractDto.fromMap(Map<String, dynamic> json) => ContractDto(
    id: json["id"],
    description: json["description"],
    deadLine: DateTime.parse(json["deadLine"]),
    deadLineSupport: DateTime.parse(json["deadLineSupport"]),
    totalPrice: json["totalPrice"],
    contractStatus: json["contractStatus"],
    partDtos: List<PartDto>.from(json["partDtos"].map((x) => PartDto.fromMap(x))),
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

  factory DocumentDto.fromJson(String str) => DocumentDto.fromMap(json.decode(str));

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
