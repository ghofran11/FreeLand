// To parse this JSON data, do
//
//     final sendConnectionParam = sendConnectionParamFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class SendConnectionParam {
  SendConnectionParam({
   required this.userId,
    this.status=1,
  });

  final String userId;
  final int status;

  SendConnectionParam copyWith({
    String? userId,
    int? status,
  }) =>
      SendConnectionParam(
        userId: userId ?? this.userId,
        status: status ?? this.status,
      );

  factory SendConnectionParam.fromJson(String str) => SendConnectionParam.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendConnectionParam.fromMap(Map<String, dynamic> json) => SendConnectionParam(
    userId: json["userId"],
    status: json["status"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "status": status,
  };
}
