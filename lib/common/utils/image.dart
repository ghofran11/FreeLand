// import 'package:memate/common/config/app_theme/app_theme.dart';
import 'dart:async';
import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:freeland/common/constant/src/url.dart';

String buildDocPath(String? docUrl) {
  if (docUrl != null) {
    return docUrl.startsWith("http")
        ? docUrl
        : AppUri.baseUrlDevelopment + docUrl;
  }
  return 'https://protkd.com/wp-content/uploads/2017/04/default-image.jpg';
}

Future<List<File?>> compressImages(List<File> files) {
  return Future.wait(_compress(files)).then((files) {
    if (!(files.every((element) => element != null))) {
      throw Exception();
    }
    return files.cast<File>();
  });
}

Iterable<Future<File?>> _compress(List<File> files, {int quality = 60}) sync* {
  for (File file in files) {
    final String filePath = file.path;
    final lastIndex = filePath.lastIndexOf('.');
    final splitted = filePath.substring(0, lastIndex);
    final outPath = "${splitted}_out.jpeg";
    File outFile = File(outPath);
    yield FlutterImageCompress.compressAndGetFile(
      file.path,
      outFile.path,
      quality: quality,
    );
  }
}
