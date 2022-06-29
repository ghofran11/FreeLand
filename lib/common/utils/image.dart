import 'package:freeland/common/constant/src/url.dart';
// import 'package:memate/common/config/app_theme/app_theme.dart';

String buildDocPath(String docUrl) {
  return docUrl.startsWith("http")
      ? docUrl
      : AppUri.baseUrlDevelopment + docUrl;
}
