// import 'dart:io';
//
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
//
// Future<File?> pickImage({bool cropImage = false}) async {
//   final pickedImage =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   final imageFile = pickedImage != null ? File(pickedImage.path) : null;
//   if (imageFile != null && cropImage) {
//     return _cropImage(imageFile);
//   }
//   return null;
// }
//
// Future<File?> _cropImage(File imageFile) async {
//   CroppedFile? croppedFile = await ImageCropper().cropImage(
//     sourcePath: imageFile.path,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.square,
//       CropAspectRatioPreset.ratio3x2,
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.ratio4x3,
//       CropAspectRatioPreset.ratio16x9
//     ],
//     // uiSettings: [
//     //   AndroidUiSettings(
//     //       toolbarTitle: 'FreeLand',
//     //       toolbarColor: Colors.deepOrange,
//     //       toolbarWidgetColor: Colors.white,
//     //       initAspectRatio: CropAspectRatioPreset.original,
//     //       lockAspectRatio: false),
//     //   IOSUiSettings(
//     //     title: 'FreeLand',
//     //   ),
//     // ],
//   );
//   if (croppedFile != null) {
//     return File(croppedFile.path);
//   }
//   return null;
// }
