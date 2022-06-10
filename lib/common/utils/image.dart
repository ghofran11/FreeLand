import 'package:freeland/common/constant/src/url.dart';
// import 'package:memate/common/config/app_theme/app_theme.dart';

String buildDocPath(String docUrl) {
  return docUrl.startsWith("http")
      ? docUrl
      : AppUri.baseUrlDevelopment + docUrl;
}
//
// Future<List<File?>> compressImages(List<File> files) {
//   return Future.wait(_compress(files)).then((files) {
//     if (!(files.every((element) => element != null))) {
//       throw Exception();
//     }
//     return files.cast<File>();
//   });
// }
//
// Iterable<Future<File?>> _compress(List<File> files, {int quality = 60}) sync* {
//   for (File file in files) {
//     final String filePath = file.path;
//     final lastIndex = filePath.lastIndexOf('.');
//     final splitted = filePath.substring(0, lastIndex);
//     final outPath = "${splitted}_out.jpeg";
//     log(outPath);
//     File outFile = File(outPath);
//     yield FlutterImageCompress.compressAndGetFile(
//       file.path,
//       outFile.path,
//       quality: quality,
//     );
//   }
// }
//
// Future<File?> pickImage() async {
//   final pickedImage =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   final imageFile = pickedImage != null ? File(pickedImage.path) : null;
//   if (imageFile != null) {
//     return _cropImage(imageFile);
//   }
//   return null;
// }
//
// Future<File?> _cropImage(File imageFile) async {
//   File? croppedFile = await ImageCropper().cropImage(
//       sourcePath: imageFile.path,
//       aspectRatioPresets: Platform.isAndroid
//           ? [
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio16x9
//             ]
//           : [
//               CropAspectRatioPreset.original,
//               CropAspectRatioPreset.square,
//               CropAspectRatioPreset.ratio3x2,
//               CropAspectRatioPreset.ratio4x3,
//               CropAspectRatioPreset.ratio5x3,
//               CropAspectRatioPreset.ratio5x4,
//               CropAspectRatioPreset.ratio7x5,
//               CropAspectRatioPreset.ratio16x9
//             ],
//       androidUiSettings: const AndroidUiSettings(
//           toolbarTitle: 'MeMate',
//           toolbarColor: AppColors.primary,
//           toolbarWidgetColor: AppColors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false),
//       iosUiSettings: const IOSUiSettings(
//         title: 'MeMate',
//       ));
//   if (croppedFile != null) {
//     return croppedFile;
//   }
//   return null;
// }
