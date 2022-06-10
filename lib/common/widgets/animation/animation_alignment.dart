import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget(
      {Key? key, this.duration, required this.child, this.begin, this.end})
      : super(key: key);
  final Widget child;
  final Offset? begin;
  final Offset? end;
  final Duration? duration;
  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animationAlign;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 400,
          ),
    )..addListener(() {
        setState(() {});
      });

    animationAlign = Tween<Offset>(
            begin: widget.begin ?? const Offset(-1, 0),
            end: widget.end ?? const Offset(0, 0))
        .animate(controller);
    controller.forward(from: 0.0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animationAlign,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
