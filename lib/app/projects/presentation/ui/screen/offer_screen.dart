import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class OfferScreen extends StatelessWidget {
  final String projectId;
  final String projectName;

  const OfferScreen({Key? key, required this.projectId, required this.projectName}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: OfferScreen(
        projectId:( state.extra as List)[0],
        projectName:( state.extra as List)[1],
      ),
    );
  }

  static const routePath = 'offer_screen';
  static const routeName = 'offer_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<ProjectBloc>(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
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
                     CustomText.titleLarge(
                      'Offer $projectName',
                      style: TextStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<ProjectBloc, ProjectState>(
                    listener: ((context, state) {
                      if (state.offerSubmission.isFail()) {
                        BotToast.showText(
                            text: state.offerSubmission.error ??
                                AppStrings.defaultErrorMsg);
                      }
                      if (state.offerSubmission.isSuccess()) {
                        context.pop();
                        BotToast.showText(text: AppStrings.defaultSuccessMsg);
                      }
                    }),
                    builder: (context, state) {
                      final ProjectBloc projectBloc =
                          context.read<ProjectBloc>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 15.0.h,
                          ),
                          const CustomText.bodyMedium(
                              "Warning: you must describe an offer in accurate details,set the price carefully, and do not forget to fill out all the official documents you have."),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          ReactiveForm(
                            formGroup: projectBloc.offerForm,
                            child: const CustomReactiveTextField(
                              formControlName: ProjectBloc.descKey,
                              labelText: 'Write your offer description',
                              keyboardType: TextInputType.text,
                              icon: FaIcon(FontAwesomeIcons.penToSquare),
                            ),
                          ),
                          SizedBox(
                            height: 15.0.h,
                          ),
                          ReactiveForm(
                            formGroup: projectBloc.offerForm,
                            child: const CustomReactiveTextField(
                              formControlName: ProjectBloc.priceKey,
                              labelText: 'What salary do you want?',
                              keyboardType: TextInputType.number,
                              icon: FaIcon(
                                Icons.monetization_on_outlined,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.0.h),
                          (!state.offerSubmission.isLoading())
                              ? ElevatedButton(
                                  onPressed: () {
                                    projectBloc.add(
                                        OfferSubmission(projectId: projectId));
                                  },
                                  child: const CustomText.bodyMedium(
                                    'Submit Offer',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              : const LoadingProgress()
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
