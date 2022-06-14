import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/domain/entities/form_status.dart';
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
            if (state.formStatus is ErrorFormStatus) {
              BotToast.showText(text: "error");
            }
          },
          builder: (context, state) {
            final LoginBloc loginBloc = context.read<LoginBloc>();
            return ReactiveForm(
              formGroup: loginBloc.loginForm,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: verticalAppPadding.h,
                  horizontal: horizontalAppPadding.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "أهلا بك مجدداً 🌟",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Column(
                      children: [
                        CustomReactiveTextField(
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          validationMessages: (control) => {
                            ValidationMessage.required: AppStrings.required,
                            ValidationMessage.email: AppStrings.required,
                          },
                          labelText: "البريد الإلكتروني",
                          formControlName: LoginBloc.emailKey,
                        ),
                        SizedBox(height: 10.0.h),
                        CustomReactiveTextField(
                          maxLines: 1,
                          keyboardType: TextInputType.text,
                          labelText: "كلمة السر",
                          validationMessages: (control) => {
                            ValidationMessage.required: AppStrings.required,
                          },
                          formControlName: LoginBloc.passwordFieldKey,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        (state.formStatus is! LoadingFormStatus)
                            ? ElevatedButton(
                                onPressed: () {
                                  loginBloc.add(LoginSubmission(context));
                                },
                                child: Text(
                                  "استمر",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                ),
                              )
                            : const CircularProgressIndicator(),
                        ElevatedButton(
                          onPressed: () {
                            context.goNamed(SignUpScreen.routeName);
                          },
                          child: Text(
                            "أنشئ حسابا",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
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
