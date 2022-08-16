import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/home/presentation/state/bloc/home_bloc.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/image_holder/image_holder.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({
    Key? key,
  }) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const ContactUsScreen(),
    );
  }

  static const routePath = 'contact_us_screen';
  static const routeName = 'contact_us_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<HomeBloc>(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
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
                      'Contact US',
                      style: const TextStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<HomeBloc, HomeState>(
                    listener: ((context, state) {
                      if (state.contactUsStatus.isFail()) {
                        BotToast.showText(
                            text: state.contactUsStatus.error ??
                                AppStrings.defaultErrorMsg);
                      }
                      if (state.contactUsStatus.isSuccess()) {
                        context.pop();
                        BotToast.showText(text: AppStrings.defaultSuccessMsg);
                      }
                    }),
                    builder: (context, state) {
                      final HomeBloc homeBloc = context.read<HomeBloc>();
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ReactiveForm(
                            formGroup: homeBloc.form,
                            child: Column(
                              children: [
                                const CustomReactiveTextField(
                                  formControlName: 'title',
                                  labelText: 'Message Title',
                                  keyboardType: TextInputType.text,
                                  icon: FaIcon(FontAwesomeIcons.penToSquare),
                                ),
                                SizedBox(
                                  height: 15.0.h,
                                ),
                                const CustomReactiveTextField(
                                  formControlName: 'msg',
                                  maxLines: null,
                                  labelText:
                                      'Write your problem or suggestions',
                                  keyboardType: TextInputType.text,
                                  icon: FaIcon(FontAwesomeIcons.penToSquare),
                                ),
                                SizedBox(
                                  height: 22.0.h,
                                ),
                                const CustomText.bodyMedium(
                                    'Select an image to explain what you want'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ImageHolder(onDeleteImage: () {
                                    homeBloc.form.control('photo').value = null;
                                  }, onUpdateImage: (image) {
                                    homeBloc.form.control('photo').value =
                                        image;
                                  }),
                                ),
                                SizedBox(
                                  height: 22.0.h,
                                ),
                                (!state.contactUsStatus.isLoading())
                                    ? ElevatedButton(
                                        onPressed: () {
                                          homeBloc.add(ContactUSSubmitted());
                                        },
                                        child: const CustomText.bodyMedium(
                                          'Submit Message',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      )
                                    : const LoadingProgress()
                              ],
                            ),
                          ),
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
