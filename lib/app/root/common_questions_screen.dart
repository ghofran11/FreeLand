import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/home/infrastructure/models/commom_question.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/generated/assets.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';

class CommonQuestionsScreen extends StatelessWidget {
  const CommonQuestionsScreen({
    Key? key,
  }) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const CommonQuestionsScreen(),
    );
  }

  static const routePath = 'common_questions_screen';
  static const routeName = 'common_questions_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(CommonQuestionsFetched()),
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state.commonQuestionsStatus.isFail()) {
                BotToast.showText(
                    text: state.commonQuestionsStatus.error ??
                        AppStrings.defaultErrorMsg);
              }
            },
            builder: (context, state) {
              final List<CommonQuestionModel> questions =
                  context.read<HomeBloc>().commonQuestions;
              if (state.commonQuestionsStatus.isSuccess()) {
                return Padding(
                  padding: screenPadding,
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
                          const CustomText.titleLarge(
                            'Common Questions',
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Image.asset(Assets.imagesCommonQuestions,
                                  height: 150.0.r),
                            ),
                            ...List.generate(
                              questions.length,
                              (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6.0),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText.headlineSmall(
                                            questions[index].question ?? ""),
                                        CustomText.bodyMedium(
                                            questions[index].answer ?? ""),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state.commonQuestionsStatus.isSuccess()) {
                return Center(
                  child: Text(state.commonQuestionsStatus.error ??
                      AppStrings.defaultErrorMsg),
                );
              }
              return const Center(child: LoadingProgress());
            },
          ),
        ),
      ),
    );
  }
}
