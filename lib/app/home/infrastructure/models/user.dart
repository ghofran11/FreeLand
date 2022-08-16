// To parse this JSON data, do
//
//     final userDto = userDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
  List<UserDto> userFromJson(List<dynamic> data) {
  return data.map((e) => UserDto.fromMap(e)).toList();
}
class UserDto {
  UserDto({
    required this.id,
    required this.fullName,
   required this.bio,
    required this.isConnect,
    required this.imagePath,
  });

  final String id;
  final String fullName;
  final String bio;
  final bool isConnect;
  final String imagePath;

  UserDto copyWith({
    String? id,
    String? fullName,
    String? bio,
    bool? isConnect,
    String? imagePath,
  }) =>
      UserDto(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        bio: bio ?? this.bio,
        isConnect: isConnect ?? this.isConnect,
        imagePath: imagePath ?? this.imagePath,
      );

  factory UserDto.fromJson(String str) => UserDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDto.fromMap(Map<String, dynamic> json) => UserDto(
    id: json["id"],
    fullName: json["fullName"],
    bio: json["bio"],
    isConnect: json["isConnect"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "fullName": fullName,
    "bio": bio,
    "isConnect": isConnect,
    "imagePath": imagePath,
  };
}
