import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddProject extends StatelessWidget {
   AddProject({Key? key}) : super(key: key);
  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: AddProject(),
    );
  }

  static const routePath = 'add_project_screen';
  static const routeName = 'add_project_screen';

    final formGroup=FormGroup(  {
      'projectName':FormControl<String>(),
      'projectDeadline':FormControl<DateTime>(),
      'projectDesc':FormControl<DateTime>(),
      'minSalary':FormControl<DateTime>(),
    }
    );

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
      body: SafeArea(
        child: ReactiveForm(
          formGroup: formGroup,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                vertical: verticalAppPadding.h,
                horizontal: horizontalAppPadding.w),
            children: [
              Row(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.primary,
                      )),
                  const CustomText.titleLarge(
                    'Add Project ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 10.0.h,),
              const CustomReactiveTextField(
                maxLines: 1,
                labelText: "Project Name",
                formControlName: "projectName",
                icon: FaIcon(Icons.settings),
              ),
              SizedBox(height: 12.0.h),
              ReactiveDateTimePicker(

                formControlName: 'projectDeadline',

                decoration:  InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius:borderRadiusCircular ,
                    borderSide: BorderSide(style: BorderStyle.none, width: 2.0.r),
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: borderRadiusCircular,
                    borderSide: BorderSide(width: 1.0.r, style: BorderStyle.none),
                  ),
                  filled: true,
                  fillColor:AppColors.white,
                  icon: const FaIcon(Icons.calendar_today),
                  labelText: 'Project Deadline',
                ),
              ),
              SizedBox(height: 12.0.h),
              const CustomReactiveTextField(
                maxLines: 1,
                labelText: "Project Description",
                formControlName: "projectDesc",
                icon: FaIcon(FontAwesomeIcons.fileSignature),
              ),
              SizedBox(height: 12.0.h),
              const CustomReactiveTextField(
                maxLines: null,
                labelText: "Min Salary",
                formControlName: "minSalary",
                keyboardType: TextInputType.number,
                icon: FaIcon(Icons.monetization_on_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
