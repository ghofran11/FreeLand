import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
class ContactUs extends StatelessWidget {
   ContactUs({Key? key}) : super(key: key);
  final formGroup=FormGroup(  {
    'Email':FormControl<String>(),
    'message':FormControl<DateTime>(),
  }
  );
   static Page pageBuilder(BuildContext context, GoRouterState state) {
     return MaterialPage<void>(
       key: state.pageKey,
       child: ContactUs(),
     );
   }

   static const routePath = 'contact_us_screen';
   static const routeName = 'contact_us_screen';

   @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.all(horizontalAppPadding.r),
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.bodyMedium("Send Message",
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
                    'Contact Us ',
                  ),
                ],
              ),
              SizedBox(height: 10.0.h,),
             const CustomText.bodyMedium(
                " If you have technical problems, problems with anyone on any topic, and  you have any questions, do not hesitate to contact us",),
              SizedBox(height: 26.0.h),
            const  CustomReactiveTextField(
                maxLines: 8,
                labelText: "Message",
                formControlName: "Email",
                icon: FaIcon(FontAwesomeIcons.pencil),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
