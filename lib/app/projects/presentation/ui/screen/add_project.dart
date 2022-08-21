import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/image_holder/image_holder.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddProject extends StatelessWidget {
  final List<CategoryDto2>? categories;
  AddProject({Key? key, this.categories}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: AddProject(
        categories: state.extra as List<CategoryDto2>,
      ),
    );
  }

  static const routePath = 'add_project_screen';
  static const routeName = 'add_project_screen';

  final formGroup = FormGroup({
    'projectName': FormControl<String>(),
    'projectDeadline': FormControl<DateTime>(),
    'projectDesc': FormControl<DateTime>(),
    'minSalary': FormControl<DateTime>(),
    'maxSalary': FormControl<DateTime>(),
    'image': FormControl<DateTime>(),
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProjectBloc>(),
      child: BlocConsumer<ProjectBloc, ProjectState>(
        listener: (context, state) {
          if (state.projectSubmission.isFail()) {
            BotToast.showText(
                text: state.projectSubmission.error ??
                    AppStrings.defaultErrorMsg);
          }
          if (state.projectSubmission.isSuccess()) {
            BotToast.showText(text: AppStrings.defaultSuccessMsg);
          }
        },
        builder: (context, state) {
          final ProjectBloc projectBloc = context.read<ProjectBloc>();
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Padding(
              padding: EdgeInsets.all(horizontalAppPadding.r),
              child: Builder(builder: (context) {
                if (!state.projectSubmission.isLoading()) {
                  return ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.bodyMedium("Save",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                      ],
                    ),
                    onPressed: () {
                      projectBloc.add(ProjectSubmission(context));
                    },
                  );
                } else {
                  return const LoadingProgress();
                }
              }),
            ),
            body: SafeArea(
              child: ReactiveForm(
                formGroup: projectBloc.addProjectForm,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    const CustomReactiveTextField(
                      maxLines: 1,
                      labelText: "Project Name",
                      formControlName: ProjectBloc.projectNameKey,
                      icon: FaIcon(Icons.settings),
                    ),
                    SizedBox(height: 12.0.h),
                    ReactiveDateTimePicker(
                      formControlName: ProjectBloc.projectDeadlineKey,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: borderRadiusCircular,
                          borderSide:
                              BorderSide(style: BorderStyle.none, width: 2.0.r),
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: borderRadiusCircular,
                          borderSide:
                              BorderSide(width: 1.0.r, style: BorderStyle.none),
                        ),
                        filled: true,
                        fillColor: AppColors.white,
                        icon: const FaIcon(Icons.calendar_today),
                        labelText: 'Project Deadline',
                      ),
                    ),
                    SizedBox(height: 12.0.h),
                    const CustomReactiveTextField(
                      maxLines: null,
                      labelText: "Project Description",
                      formControlName: ProjectBloc.projectDescKey,
                      icon: FaIcon(FontAwesomeIcons.fileSignature),
                    ),
                    SizedBox(height: 12.0.h),
                    const CustomReactiveTextField(
                      maxLines: null,
                      labelText: "Min Budget",
                      formControlName: ProjectBloc.minSalaryKey,
                      keyboardType: TextInputType.number,
                      icon: FaIcon(Icons.monetization_on_outlined),
                    ),
                    SizedBox(height: 12.0.h),
                    const CustomReactiveTextField(
                      maxLines: null,
                      labelText: "Max Budget",
                      formControlName: ProjectBloc.maxSalaryKey,
                      keyboardType: TextInputType.number,
                      icon: FaIcon(Icons.monetization_on_outlined),
                    ),
                    SizedBox(height: 12.0.h),
                    ReactiveDropdownSearchMultiSelection<CategoryDto2,
                            CategoryDto2>(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: borderRadiusCircular,
                              borderSide: BorderSide(
                                  style: BorderStyle.none, width: 2.0.r),
                            ),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: borderRadiusCircular,
                              borderSide: BorderSide(
                                  width: 1.0.r, style: BorderStyle.none),
                            ),
                            filled: true,
                            fillColor: AppColors.white,
                            icon: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.lightbulb,
                                color: AppColors.grey2,
                                size: 20,
                              ),
                            ),
                            labelText: ' Category'),
                        mode: Mode.MENU,
                        formControlName: ProjectBloc.categoryKey,
                        items: categories,
                        itemAsString: (CategoryDto2? u) => u!.name),
                    SizedBox(
                      height: 22.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35.0.h),
                      child: const CustomText.bodyMedium(
                          'Select an image to explain what you want'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ImageHolder(onDeleteImage: () {
                        projectBloc.addProjectForm
                            .control(ProjectBloc.imageKey)
                            .value = null;
                      }, onUpdateImage: (image) {
                        projectBloc.addProjectForm
                            .control(ProjectBloc.imageKey)
                            .value = image;
                      }),
                    ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
