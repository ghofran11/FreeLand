import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/auth/domain/entities/form_status.dart';
import 'package:freeland/app/auth/presentation/login/login_bloc/login_bloc.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Log in ",
                      style: TextStyle(color: Colors.black),
                    ),
                    const Text(
                      "PhoneNumber ",
                      style: TextStyle(color: Colors.black),
                    ),
                    ReactiveTextField(
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      validationMessages: (control) => {
                        ValidationMessage.required: "مطلوب",
                        ValidationMessage.number: "رقم",
                      },
                      formControlName: LoginBloc.phoneNumberKey,
                    ),
                    const Text(
                      "PassWord ",
                      style: TextStyle(color: Colors.black),
                    ),
                    ReactiveTextField(
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      validationMessages: (control) => {
                        ValidationMessage.required: "مطلوب",
                      },
                      formControlName: LoginBloc.passwordFieldKey,
                    ),
                    (state.formStatus is! LoadingFormStatus)
                        ? ElevatedButton(
                            onPressed: () {
                              loginBloc.add(LoginSubmission(context));
                            },
                            child: Text(
                              "استمر",
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
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
