import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../utils/image.dart';

// class ImageFullScreenWrapperWidget extends StatelessWidget {
//   final ImageProvider image;
//   final bool dark;
//   ImageFullScreenWrapperWidget({
//     required this.image,
//     this.dark = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//
//       },
//       child: Image(image: image),
//     );
//   }
// }

class FullScreenPage extends StatefulWidget {
  ///Navigator.push(
  ///context,
  ///PageRouteBuilder(
  ///opaque: false,
  /// barrierColor: dark ? Colors.black : Colors.white,
  ///pageBuilder: (BuildContext context, _, __) {
  ///return FullScreenPage(
  ///dark: true,
  ///url: image,
  ///);
  ///},
  ///),
  ///);
  FullScreenPage({required this.dark, required this.url});
  final bool dark;
  final String url;
  @override
  _FullScreenPageState createState() => _FullScreenPageState();
}

class _FullScreenPageState extends State<FullScreenPage> {
  @override
  void initState() {
    // var brightness = Theme.of(context).brightness;
    // var color = widget.dark ? Colors.black12 : Colors.white70;
    //
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   systemNavigationBarColor: color,
    //   statusBarColor: color,
    //   statusBarBrightness: brightness,
    //   statusBarIconBrightness: brightness,
    //   systemNavigationBarDividerColor: color,
    //   systemNavigationBarIconBrightness: brightness,
    // ));
    super.initState();
  }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       // Restore your settings here...
  //       ));
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.dark ? Colors.black : Colors.white,
      body: Stack(
        children: [
          Stack(
            children: [
              Center(
                child: ExtendedImage.network(
                  widget.url.startsWith('http')
                      ? widget.url
                      : buildDocPath(widget.url),
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  //enableLoadState: false,
                  mode: ExtendedImageMode.gesture,
                  initGestureConfigHandler: (state) {
                    return GestureConfig(
                      minScale: 0.9,
                      animationMinScale: 0.7,
                      maxScale: 3.0,
                      animationMaxScale: 3.5,
                      speed: 1.0,
                      inertialSpeed: 100.0,
                      initialScale: 1.0,
                      inPageView: false,
                      initialAlignment: InitialAlignment.center,
                    );
                  },
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: MaterialButton(
                padding: const EdgeInsets.all(15),
                elevation: 0,
                child: Icon(
                  Icons.arrow_back,
                  color: widget.dark ? Colors.white : Colors.black,
                  size: 25,
                ),
                color: widget.dark ? Colors.black12 : Colors.white70,
                highlightElevation: 0,
                minWidth: double.minPositive,
                height: double.minPositive,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
