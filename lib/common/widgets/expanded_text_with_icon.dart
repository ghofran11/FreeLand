import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/reponsive_utils.dart';

class ExpandedTextWithIcon extends StatefulWidget {
  const ExpandedTextWithIcon({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<ExpandedTextWithIcon> createState() => _ExpandedTextWithIconState();
}

class _ExpandedTextWithIconState extends State<ExpandedTextWithIcon> {
  bool isExpanded = false;
  var myChildSize = Size.zero;
  @override
  Widget build(BuildContext context) {
    final styleBody =
        Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 12);
    // TextStyle(
    // fontSize: 12,
    // overflow: TextOverflow.ellipsis,
    // fontWeight: FontWeight.w400,
    // color: AppColors.text1);

    var maxLines2 = isExpanded ? 10 : 1;
    return RPadding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizeReportingWidget(
              onSizeChange: (Size value) {
                setState(
                  () {
                    if (!isExpanded) {
                      myChildSize = value;
                    }
                  },
                );
              },
              child: Expanded(
                child: Text(
                  widget.text,
                  maxLines: maxLines2,
                  style: styleBody,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          Visibility(
              visible: hasTextOverflow(
                widget.text,
                styleBody!,
                maxLines: 1,
                maxWidth: myChildSize.width > 15
                    ? myChildSize.width - 8
                    : myChildSize.width,
              ),
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: RotatedBox(
                      quarterTurns: isExpanded ? -45 : 45,
                      child: CircleAvatar(
                        radius: 10.r,
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 10.r,
                          ),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}

class AnimationIconApp extends StatefulWidget {
  const AnimationIconApp({Key? key}) : super(key: key);

  @override
  _AnimationIconAppState createState() => _AnimationIconAppState();
}

class _AnimationIconAppState extends State<AnimationIconApp>
    with TickerProviderStateMixin {
  late AnimationController animationController1;

  late Animation<double> animation1;

  @override
  void initState() {
    animationController1 = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    animation1 = Tween<double>(begin: pi / 2, end: -pi / 2)
        .animate(animationController1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _rotateChildContinuously,
        child: RotateTrans(
            const Icon(
              Icons.arrow_back_ios,
              size: 10,
            ),
            animation1));
  }

  _rotateChildContinuously() {
    if (animationController1.isCompleted) {
      animationController1.reverse(from: pi);
    } else if (animation1.isDismissed) {
      animationController1.forward(from: 0);
    }
  }
}

class RotateTrans extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  const RotateTrans(this.child, this.animation, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value,
          child: child,
        );
      },
    );
  }
}
