import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

final form = FormGroup(
  {
    'desc': FormControl<String>(validators: [
      Validators.required,
    ]),
    'levels': FormControl<int>(validators: [
      Validators.required,
      Validators.number,
    ]),
    'deadline_support': FormControl<int>(validators: [
      Validators.required,
    ]),
    'deadline': FormControl<int>(validators: [
      Validators.required,
      Validators.number,
    ]),
    'price': FormControl<int>(validators: [
      Validators.required,
    ]),
  },
);

class ContractScreen extends StatelessWidget {
  const ContractScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const ContractScreen(),
    );
  }

  static const routePath = 'contract_screen';
  static const routeName = 'contract_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ReactiveForm(
        formGroup: form,
        child: ListView(
          padding: screenPadding,
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
                  'Flower Lab Contract ',
                ),
              ],
            ),
            Row(
              children: const [
                CustomText.bodyMedium(
                  'Project Owner: ',
                ),
                CustomText.bodyMedium(
                  'Mahmoud Mahmoud',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: const [
                CustomText.bodyMedium(
                  'Project Owner: ',
                ),
                CustomText.bodyMedium(
                  'Mahmoud Ahmed',
                  style: TextStyle(color: AppColors.primary),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(thickness: 1.5),
            ),
            const CustomReactiveTextField(
              formControlName: 'desc',
              maxLines: 6,
              labelText: "Project Description",
              hintText: "Plaeas add a clear full description of this contract ",
            ),
            SizedBox(
              height: 12.0.h,
            ),
            const CustomReactiveTextField(
              formControlName: 'levels',
              maxLines: 1,
              labelText: "Number of Levels",
              keyboardType: TextInputType.number,
            ),
            ReactiveValueListenableBuilder(
                formControlName: 'levels',
                builder: (context, control, child) {
                  if (form.control('levels').value != null) {
                    return Column(
                      children: List.generate(
                          form.control('levels').value as int,
                          (index) => Card(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Column(
                                  children: [
                                    CustomText.titleLarge(
                                        'Level : ${index + 1}',
                                        style: TextStyle(
                                            color: index % 2 == 0
                                                ? AppColors.green
                                                : AppColors.yellowAccent)),
                                    const CustomReactiveTextField(
                                      formControlName: 'price',
                                      maxLines: 1,
                                      labelText: "Price Of the level",
                                      keyboardType: TextInputType.number,
                                    ),
                                    const CustomReactiveTextField(
                                      formControlName: 'deadline',
                                      maxLines: 1,
                                      labelText: "Deadline",
                                    ),
                                    const CustomReactiveTextField(
                                      formControlName: 'deadline_support',
                                      maxLines: 1,
                                      hintText:
                                          'At this date technical support from freelancer stops',
                                      labelText: "Support Deadline",
                                    ),
                                  ],
                                ),
                              )),
                    );
                  } else {
                    return Container();
                  }
                }),
            ElevatedButton(onPressed: () {}, child: const Text('Submit Contract'))
          ],
        ),
      )),
    );
  }
}
