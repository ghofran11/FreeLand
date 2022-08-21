import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/presentation/state/my_proflile_bloc/my_profile_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
    return BlocProvider(
      create: (context) => getIt<ProjectBloc>(),
      child: Scaffold(
        body: BlocConsumer<ProjectBloc, ProjectState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final form = context.read<ProjectBloc>().contractForm;
            final levelsForm = context.read<ProjectBloc>().levelsForm;
            return SafeArea(
              child: ReactiveForm(
                formGroup: form,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
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

                        ///ToDo:

                        const CustomText.titleLarge(
                          'Flower Lab Contract ',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const CustomText.bodyMedium(
                          'Project Owner: ',
                        ),
                        CustomText.bodyMedium(
                          context.read<MyProfileBloc>().state.profile!.fullName,
                          style: const TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: const [
                        CustomText.bodyMedium(
                          'Project FreeLancer: ',
                        ),

                        ///ToDo:

                        CustomText.bodyMedium(
                          'Mahmoud Ahmed',
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const CustomText.bodyMedium(
                      'Please be careful and clear when you fill this contract because this contract protects your rights.',
                      style: TextStyle(color: AppColors.red),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(thickness: 1.5),
                    ),
                    const CustomReactiveTextField(
                      formControlName: 'desc',
                      maxLines: null,
                      labelText: "Project Description",
                      hintText:
                          "Please add a clear full description of this contract ",
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ReactiveDateTimePicker(
                      formControlName: 'deadline',
                      decoration: dateTimePickerDecoration('Deadline'),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    ReactiveDateTimePicker(
                      formControlName: 'deadline_support',
                      decoration: dateTimePickerDecoration('Support Deadline'),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const CustomReactiveTextField(
                      formControlName: 'price',
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      labelText: "Total Price",
                      hintText: "Please add the total price of your project ",
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
                    SizedBox(
                      height: 12.0.h,
                    ),
                    ReactiveValueListenableBuilder(
                        formControlName: 'levels',
                        builder: (context, control, child) {
                          int numOfLevels = form.control('levels').value ?? 0;
                          return ReactiveForm(
                              formGroup: levelsForm,
                              child: Builder(
                                builder: (context) {
                                  if (numOfLevels != 0) {
                                    final formArray = levelsForm
                                        .control('levelsArray') as FormArray;
                                    final List<FormGroup> list = [];
                                    for (int i = 0; i < numOfLevels; i++) {
                                      list.add(oneLevelForm(i));
                                    }
                                    formArray.addAll(list);
                                    return Column(
                                      children:
                                          List.generate(numOfLevels, (index) {
                                        final FormGroup thisLeveFormGroup =
                                            formArray.controls[index]
                                                as FormGroup;
                                        return ReactiveForm(
                                            formGroup: thisLeveFormGroup,
                                            child: Card(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10.0),
                                                      child: CustomText
                                                          .headlineSmall(
                                                              'Level  ${(thisLeveFormGroup.control('order').value as int) + 1}',
                                                              style: TextStyle(
                                                                color: index %
                                                                            2 ==
                                                                        0
                                                                    ? AppColors
                                                                        .primary
                                                                    : AppColors
                                                                        .purple,
                                                              )),
                                                    ),
                                                    const Divider(
                                                      thickness: 1.5,
                                                    ),
                                                    const CustomReactiveTextField(
                                                      formControlName: 'price',
                                                      maxLines: 1,
                                                      labelText:
                                                          "Price of the level",
                                                      keyboardType:
                                                          TextInputType.number,
                                                    ),
                                                    const CustomReactiveTextField(
                                                      formControlName:
                                                          'description',
                                                      maxLines: null,
                                                      hintText:
                                                          'Clear Description of the level',
                                                      labelText: "Description",
                                                    ),
                                                    ReactiveDateTimePicker(
                                                      formControlName:
                                                          'deadLine',
                                                      decoration:
                                                          dateTimePickerDecoration(
                                                              'Level Deadline'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                      }),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ));
                        }),
                    ElevatedButton(
                        onPressed: () {
                          ///ToDo:
                          context.read<ProjectBloc>().add(const AddContract(
                                freelancerId: "l",
                                projectId: "l",
                              ));
                        },
                        child: const Text('Submit Contract'))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  FormGroup oneLevelForm(int order) => FormGroup({
        'order': FormControl<int>(validators: [], value: order),
        'price': FormControl<int>(validators: [
          Validators.required,
        ]),
        'deadLine': FormControl<DateTime>(validators: [
          Validators.required,
        ]),
        'description': FormControl<String>(validators: [
          Validators.required,
        ]),
      });
}

InputDecoration dateTimePickerDecoration(String label) => InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadiusCircular,
        borderSide: BorderSide(style: BorderStyle.none, width: 2.0.r),
      ),
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadiusCircular,
        borderSide: BorderSide(width: 1.0.r, style: BorderStyle.none),
      ),
      filled: true,
      fillColor: AppColors.white,
      labelText: label,
      prefixIcon: const Padding(
        padding: EdgeInsets.all(12.0),
        child: FaIcon(
          FontAwesomeIcons.calendarDays,
          color: AppColors.primary,
          size: 20,
        ),
      ),
    );
