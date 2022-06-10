import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/colors.dart';

class CustomStyleTextField extends StatelessWidget {
  const CustomStyleTextField({
    Key? key,
    this.styleFromHome = false,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);
  final String? hintText;
  final IconData? prefixIcon;
  final bool styleFromHome;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.r,
      child: Padding(
        padding: EdgeInsets.only(right: 34, left: 13),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: !styleFromHome
                  ? [
                      BoxShadow(
                        offset: const Offset(0, 4),
                        blurRadius: 10,
                        color: Colors.black.withOpacity(.05),
                      ),
                    ]
                  : [
                      BoxShadow(
                          offset: const Offset(0, 8),
                          blurRadius: 6,
                          color: Colors.black.withOpacity(.05),
                          spreadRadius: .1),
                      BoxShadow(
                          offset: const Offset(0, 20),
                          blurRadius: 15,
                          color: Colors.black.withOpacity(.1),
                          spreadRadius: 0.1),
                    ]),
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.caption,
                prefixIcon: prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: AppColors.purple,
                      )
                    : null,
                filled: true,
                enabled: false,
                border: InputBorder.none,
                hintText: hintText,
                contentPadding:
                    REdgeInsets.only(left: 14.0, bottom: 8.0, right: 14),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    styleFromHome ? 15 : 10,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    styleFromHome ? 15 : 10,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}

class OutLinedTextField extends StatelessWidget {
  const OutLinedTextField({Key? key, this.hintText, this.prefixIcon})
      : super(key: key);
  final IconData? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                  )
                : null,
            filled: true,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, right: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.border1.withOpacity(.2),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.border1.withOpacity(.2)),
              borderRadius: BorderRadius.circular(
                10,
              ),
            )),
      ),
    );
  }
}
