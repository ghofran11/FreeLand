// To parse this JSON data, do
//
//     final sendResponseParam = sendResponseParamFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SendResponseParam {
  SendResponseParam({
    required this.id,
    required this.isAccepted,
  });

  final String id;
  final bool isAccepted;

  SendResponseParam copyWith({
    String? id,
    bool? isAccepted,
  }) =>
      SendResponseParam(
        id: id ?? this.id,
        isAccepted: isAccepted ?? this.isAccepted,
      );

  factory SendResponseParam.fromJson(String str) => SendResponseParam.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendResponseParam.fromMap(Map<String, dynamic> json) => SendResponseParam(
    id: json["id"],
    isAccepted: json["isAccepted"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "isAccepted": isAccepted,
  };
}
