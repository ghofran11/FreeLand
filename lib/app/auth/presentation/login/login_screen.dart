import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/presentation/login/login_bloc/login_bloc.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/loading_progress.dart';
import 'package:freeland/common/widgets/text.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/generated/assets.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../common/constant/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const LoginScreen(),
    );
  }

  static const routePath = '/login_screen';
  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => getIt<LoginBloc>(),
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.formStatus.isFail()) {
                  BotToast.showText(
                      text:
                      state.formStatus.error ?? AppStrings.defaultErrorMsg);
                }
              },
              builder: (context, state) {
                final LoginBloc loginBloc = context.read<LoginBloc>();
                return ReactiveForm(
                  formGroup: loginBloc.loginForm,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalAppPadding.w,
                      ),
                      child: ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                          SizedBox(height: verticalAppPadding.h),
                      Column(
                        children: [
                          Icon(Icons.admin_panel_settings_outlined,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              size: 150.0.r),
                          SizedBox(height: 4.0.h),
                          Text(
                            "Welcome Back To FreeLand",
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline5,
                          ),
                          SizedBox(height: 8.0.h),
                          Text(
                            "Login to your account",
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle1,
                          ),
                        ],
                      ),
                      SizedBox(height: 100.0.h),
                      Column(
                        children: [
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            validationMessages: (control) =>
                            {
                              ValidationMessage.required: AppStrings.required,
                            },
                            prefixPath: Assets.iconsUser,
                            labelText: "User Name",
                            formControlName: LoginBloc.emailKey,
                          ),
                          SizedBox(height: 20.0.h),
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            labelText: "Password",
                            validationMessages: (control) =>
                            {
                              ValidationMessage.required: AppStrings.required,
                            },
                            formControlName: LoginBloc.passwordFieldKey,
                            prefixPath: Assets.iconsLock,
                            obscureText: true,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ReactiveCheckbox(
                            formControlName: LoginBloc.rememberMeKey,
                          ),
                          const CustomText.bodyMedium('Remember me'),
                        ],
                      ),
                      SizedBox(height: 100.0.h),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          (!state.formStatus.isLoading())
                      ? ElevatedButton(
                    onPressed: () {
                      loginBloc.add(const LoginSubmission());
                    },
                    child: CustomText.bodyMedium(
                      "Login",
                      style: TextStyle(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .onPrimary),
                    ),
                  )
                      : const LoadingProgress(),

                  SizedBox(height: 4.0.h),
                 if (!state.formStatus.isLoading())

                  OutlinedButton(
                    onPressed: () {
                      context.goNamed(SignUpScreen.routeName);
                    },
                    child: const Text(
                      "SignUp",
                    ),
                  ),
                  ],
                )],
                )
                ,
                )
                ,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
