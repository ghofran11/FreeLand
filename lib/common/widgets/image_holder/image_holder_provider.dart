// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:freeland/common/widgets/image_holder/utils.dart';
//
// import 'image_file.dart';
//
// class ImageHolderProvider extends ChangeNotifier {
//   ///************* forms *******************
//
//   ImageHolderProvider();
//
//   ImageFile image = const ImageFile();
//   bool loading = false;
//
//   Future onPickImage() async {
//     final File? _image = await pickImage();
//
//     if (_image != null) {
//       image = ImageFile(image: _image);
//       notifyListeners();
//     }
//   }
//
//   onDeleteImage() {
//     image = const ImageFile();
//     notifyListeners();
//   }
// }
