// To parse this JSON data, do
//
//     final commentDto = commentDtoFromMap(jsonString);

import 'dart:convert';

class CommentDto {
  CommentDto({
    required this.parentCommentId,
    required this.text,
    required this.serviceId,
    required this.offerId,
  });

  final String? parentCommentId;
  final String text;
  final String serviceId;
  final String? offerId;

  CommentDto copyWith({
    required String parentCommentId,
    required String text,
    required String serviceId,
    required String offerId,
  }) =>
      CommentDto(
        parentCommentId: parentCommentId,
        text: text,
        serviceId: serviceId,
        offerId: offerId,
      );

  factory CommentDto.fromJson(String str) =>
      CommentDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentDto.fromMap(Map<String, dynamic> json) => CommentDto(
        parentCommentId: json["parentCommentId"],
        text: json["text"],
        serviceId: json["serviceId"],
        offerId: json["offerId"],
      );

  Map<String, dynamic> toMap() => {
        "parentCommentId": parentCommentId,
        "text": text,
        "serviceId": serviceId,
        "offerId": offerId,
      };
}
