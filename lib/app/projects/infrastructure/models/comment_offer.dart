// To parse this JSON data, do
//
//     final commentOfferDto = commentOfferDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
List<CommentOfferDto> commentsFromJson(List<dynamic> data) {
  return data.map((e) => CommentOfferDto.fromJson(e)).toList();
}

class CommentOfferDto {
  CommentOfferDto({
    required this.id,
    required this.parentCommentId,
    required this.text,
    required this.senderId,
    required this.senderName,
    required this.serviceId,
    required this.sericeName,
    required this.offerId,
    required this.offerName,
  });

  final String id;
  final String parentCommentId;
  final String text;
  final String senderId;
  final String senderName;
  final String serviceId;
  final String sericeName;
  final String offerId;
  final String offerName;

  CommentOfferDto copyWith({
    String? id,
    String? parentCommentId,
    String? text,
    String? senderId,
    String? senderName,
    String? serviceId,
    String? sericeName,
    String? offerId,
    String? offerName,
  }) =>
      CommentOfferDto(
        id: id ?? this.id,
        parentCommentId: parentCommentId ?? this.parentCommentId,
        text: text ?? this.text,
        senderId: senderId ?? this.senderId,
        senderName: senderName ?? this.senderName,
        serviceId: serviceId ?? this.serviceId,
        sericeName: sericeName ?? this.sericeName,
        offerId: offerId ?? this.offerId,
        offerName: offerName ?? this.offerName,
      );

  factory CommentOfferDto.fromJson(String str) => CommentOfferDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CommentOfferDto.fromMap(Map<String, dynamic> json) => CommentOfferDto(
    id: json["id"],
    parentCommentId: json["parentCommentId"],
    text: json["text"],
    senderId: json["senderId"],
    senderName: json["senderName"],
    serviceId: json["serviceId"],
    sericeName: json["sericeName"],
    offerId: json["offerId"],
    offerName: json["offerName"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "parentCommentId": parentCommentId,
    "text": text,
    "senderId": senderId,
    "senderName": senderName,
    "serviceId": serviceId,
    "sericeName": sericeName,
    "offerId": offerId,
    "offerName": offerName,
  };
}
