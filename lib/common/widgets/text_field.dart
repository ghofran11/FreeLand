import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as provider;
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomReactiveTextField<T> extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? formControlName;
  final String? prefixPath;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Function()? onTap;
  final Color? backgroundColor;
  final Color? contentColor;
  final TextEditingController? controller;
  final int? maxLines;
  final bool? obscureText;
  final bool readOnly;
  final Map<String, String> Function(FormControl control)? validationMessages;
  final double? iconSize;
  final EdgeInsets? contentPadding;
  final BoxConstraints? prefixIconConstraints;
  final Color? iconColor;
  final Widget? icon;
  final Widget? suffix;
  final ControlValueAccessor<T, String>? valueAccessor;
  final VoidCallback? onSubmitted;

  const CustomReactiveTextField({
    Key? key,
    this.hintText,
    this.labelText,
    this.validationMessages,
    this.formControlName,
    this.prefixPath,
    this.prefixIcon,
    this.keyboardType,
    this.focus,
    this.textInputAction,
    this.onTap,
    this.backgroundColor,
    this.contentColor,
    this.controller,
    this.maxLines = 1,
    this.obscureText,
    this.iconSize,
    this.contentPadding,
    this.prefixIconConstraints,
    this.iconColor,
    this.icon,
    this.suffix,
    this.readOnly = false,
    this.valueAccessor,
    this.suffixIcon,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _CustomReactiveTextFieldState createState() =>
      _CustomReactiveTextFieldState<T>();
}

class _CustomReactiveTextFieldState<T>
    extends State<CustomReactiveTextField<T>> {
  bool? _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ReactiveTextField<T>(
      formControlName: widget.formControlName,
      obscureText: _obscureText ?? false,
      focusNode: widget.focus,
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      onTap: widget.onTap,
      onSubmitted: widget.onSubmitted,
      validationMessages: widget.validationMessages,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      valueAccessor: widget.valueAccessor,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,

        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(style: BorderStyle.none, width: 2.0.r),
        ),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadiusCircular,
          borderSide: BorderSide(width: 1.0.r, style: BorderStyle.none),
        ),
        hintText: widget.hintText,
        labelText: widget.labelText,

        fillColor: themeData.cardTheme.color,
        filled: true,
        icon: widget.icon,
        suffix: widget.suffix,
        iconColor: AppColors.borderColor,
        hintStyle: themeData.textTheme.labelSmall
            ?.copyWith(color: themeData.disabledColor),
        suffixIcon: _obscureText != null
            ? IconButton(
                onPressed: _onTapEye,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  switchInCurve: Curves.easeInCubic,
                  switchOutCurve: Curves.easeInOutCirc,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SizeTransition(
                      sizeFactor: animation,
                      child: child,
                    ),
                  ),
                  child: Icon(
                    _obscureText! ? Icons.visibility_off : Icons.visibility,
                    size: widget.iconSize,
                    color: AppColors.borderColor,
                    key: Key(
                      _obscureText.toString(),
                    ),
                  ),
                ),
              )
            : (widget.suffixIcon != null)
                ? Padding(
                    padding: EdgeInsets.all(14.0.r),
                    child: widget.suffixIcon,
                  )
                : null,

        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: widget.iconSize ?? themeData.iconTheme.size,
                color: widget.iconColor ?? themeData.primaryColor,
              )
            : widget.prefixPath != null
                ? Container(
                    clipBehavior: Clip.hardEdge,
                    height: widget.iconSize ?? themeData.iconTheme.size,
                    width: widget.iconSize ?? themeData.iconTheme.size,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: provider.Svg(
                      widget.prefixPath!,
                      size: Size(widget.iconSize ?? themeData.iconTheme.size!,
                          widget.iconSize ?? themeData.iconTheme.size!),
                      color: widget.iconColor ?? themeData.primaryColor,
                    ))),
                  )
                : null,
        // prefixIconConstraints: widget.prefixIconConstraints,
      ),
    );
  }

  void _onTapEye() => setState(() => _obscureText = !_obscureText!);

  @override
  void dispose() {
    super.dispose();
  }
}
