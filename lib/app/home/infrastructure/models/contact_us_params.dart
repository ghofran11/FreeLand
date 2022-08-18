import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freeland/common/utils/image.dart';

class ContactUSModel {
  final String title;
  final String description;
  final File? image;

  ContactUSModel({
    required this.title,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  Future<FormData> formData() async => FormData.fromMap(toJson()
    ..addAll({
      "files": image != null
          ? await MultipartFile.fromFile(
              (await compressImages([image!])).first!.path)
          : null,
    }));
}
