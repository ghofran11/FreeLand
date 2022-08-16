// import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class AppLauncher {
  static void launchPhone(String phone) {
    launch("tel:" + phone);
  }

  static void launchEmail(String path) async {
    final url = Uri(
      scheme: 'mailto',
      path: path,
    ).toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void generalLaunch(String path) async {
    try {
      await launch(path);
    } catch (_) {}
  }

  // static launchMap(
  //     {required String lat, required String long, required String name}) async {
  //   MapLauncher.showMarker(
  //       mapType: MapType.google,
  //       coords: Coords(double.parse(lat), double.parse(long)),
  //       title: name);
  // }
}
