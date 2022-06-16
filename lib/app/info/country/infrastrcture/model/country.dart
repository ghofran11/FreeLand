// To parse this JSON data, do
//
//     final countryDto = countryDtoFromJson(jsonString);

import 'dart:convert';

List<CountryDto> countriesFromJson(List<dynamic> data) {
  return data.map((e) => CountryDto.fromJson(e)).toList();
}

class CountryDto {
  CountryDto({
    required this.id,
    required this.name,
    required this.cityDtos,
  });

  final String id;
  final String name;
  final List<CityDto> cityDtos;

  CountryDto copyWith({
    String? id,
    String? name,
    List<CityDto>? cityDtos,
  }) =>
      CountryDto(
        id: id ?? this.id,
        name: name ?? this.name,
        cityDtos: cityDtos ?? this.cityDtos,
      );

  factory CountryDto.fromRawJson(String str) =>
      CountryDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryDto.fromJson(Map<String, dynamic> json) => CountryDto(
        id: json["id"],
        name: json["name"],
        cityDtos: List<CityDto>.from(
            json["cityDtos"].map((x) => CityDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cityDtos": List<dynamic>.from(cityDtos.map((x) => x.toJson())),
      };
}

class CityDto {
  CityDto({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  CityDto copyWith({
    String? id,
    String? name,
  }) =>
      CityDto(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CityDto.fromRawJson(String str) => CityDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CityDto.fromJson(Map<String, dynamic> json) => CityDto(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
