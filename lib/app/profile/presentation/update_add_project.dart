import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

FormGroup formGroup = FormGroup({
  "name": FormControl<String>(),
  "bio": FormControl<String>(),
  "categories_search": FormControl<String>(),
});

class AddUpdateProject extends StatelessWidget {
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: AddUpdateProject(),
    );
  }

  static const routePath = 'update_add_project';
  static const routeName = 'update_add_project';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(horizontalAppPadding.r),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.bodyMedium("Save",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: CustomText.titleLarge("Add/Update Project"),
      ),
      body: SafeArea(
        child: ReactiveForm(
          formGroup: formGroup,
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                vertical: verticalAppPadding.h,
                horizontal: horizontalAppPadding.w),
            children: [
              CustomText.bodyMedium(""),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _labels = ["DEsign", "Front", "Back end"];
  List<String> _labels2 = ["DEsign2", "Front2", "Back end2"];
}
