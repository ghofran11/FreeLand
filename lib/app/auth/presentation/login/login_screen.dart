import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/presentation/login/login_bloc/login_bloc.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/common/config/theme/src/styles.dart';
import 'package:freeland/common/widgets/test_field.dart';
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
                 BotToast.showText(text: "error");
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
                  children: [
                    SizedBox(height: 12.0.h),
                    Column(
                      children: [
                        Icon(Icons.admin_panel_settings_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 150.0.r),
                        SizedBox(height: 4.0.h),
                        Text(
                          "Welcome Back To FreeLand",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(height: 8.0.h),
                        Text(
                          "We Missed You!",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0.h),
                    Column(
                      children: [
                        CustomReactiveTextField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          validationMessages: (control) => {
                            ValidationMessage.required: AppStrings.required,
                          },
                          labelText: "User Name",
                          formControlName: LoginBloc.emailKey,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomReactiveTextField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          labelText: "Password",
                          validationMessages: (control) => {
                            ValidationMessage.required: AppStrings.required,
                          },
                          formControlName: LoginBloc.passwordFieldKey,
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0.h),
                    Column(
                      children: [
                        (!state.formStatus.isLoading())
                            ? SizedBox(
                                width: 120.0.w,
                                child: ElevatedButton(
                                  onPressed: () {
                                    loginBloc.add(LoginSubmission(context));
                                  },
                                  child: const Text(
                                    "Login",
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator(),
                        SizedBox(height: 4.0.h),
                        SizedBox(
                          width: 120.0.w,
                          child: OutlinedButton(
                            onPressed: () {
                              context.goNamed(SignUpScreen.routeName);
                            },
                            child: const Text(
                              "SignUp",
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ))),
    );
  }
}
