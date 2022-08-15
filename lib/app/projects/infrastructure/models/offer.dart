// To parse this JSON data, do
//
//     final offerDto = offerDtoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class OfferDto {
  OfferDto({
    required this.serviceId,
    required this.text,
   required this.price,
  });

  final String serviceId;
  final String text;
  final int price;

  OfferDto copyWith({
    required String serviceId,
    required String text,
    required int price,
  }) =>
      OfferDto(
        serviceId: serviceId,
        text: text ,
        price: price ,
      );

  factory OfferDto.fromJson(String str) => OfferDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OfferDto.fromMap(Map<String, dynamic> json) => OfferDto(
    serviceId: json["serviceId"],
    text: json["text"],
    price: json["price"],
  );

  Map<String, dynamic> toMap() => {
    "serviceId": serviceId,
    "text": text,
    "price": price,
  };
}
