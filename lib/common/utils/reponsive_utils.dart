import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool hasTextOverflow(String text, TextStyle style,
    {double minWidth = 0,
    double maxWidth = double.infinity,
    int maxLines = 2}) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLines,
    textDirection: TextDirection.rtl,
  )..layout(minWidth: minWidth, maxWidth: maxWidth);
  return textPainter.didExceedMaxLines;
}

class WidgetPosition {
  static List<double?> getSizes(GlobalKey key) {
    final RenderBox? renderBoxRed =
        key.currentContext?.findRenderObject() as RenderBox?;
    final sizeRed = renderBoxRed?.size;
    // print("SIZE: $sizeRed");
    return [sizeRed?.width, sizeRed?.height];
  }

  // getPositions(GlobalKey key) {
  //   final RenderBox renderBoxRed = key.currentContext.findRenderObject();
  //   final positionRed = renderBoxRed.localToGlobal(Offset.zero);
  //   // print("POSITION: $positionRed ");
  //   return [positionRed.dx, positionRed.dy];
  // }
}

class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    Key? key,
    required this.child,
    required this.onSizeChange,
  }) : super(key: key);

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    if (!mounted) {
      return;
    }
    final size = context.size!;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }
}

////// not used
typedef void OnWidgetSizeChange(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}
