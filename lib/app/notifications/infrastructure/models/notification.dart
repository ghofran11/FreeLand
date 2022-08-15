// To parse this JSON data, do
//
//     final notificationDto = notificationDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<NotificationDto> NotificationFromJson(List<dynamic> data) {
  return data.map((e) => NotificationDto.fromJson(e)).toList();
}

class NotificationDto {
  NotificationDto({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
    required this.isRead,
  });

  final String id;
  final String title;
  final String body;
  final DateTime date;
  final bool isRead;

  NotificationDto copyWith({
    String? id,
    String? title,
    String? body,
    DateTime? date,
    bool? isRead,
  }) =>
      NotificationDto(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        date: date ?? this.date,
        isRead: isRead ?? this.isRead,
      );

  factory NotificationDto.fromJson(String str) => NotificationDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationDto.fromMap(Map<String, dynamic> json) => NotificationDto(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    date: DateTime.parse(json["date"]),
    isRead: json["isRead"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "body": body,
    "date": date.toIso8601String(),
    "isRead": isRead,
  };
}
