import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_event.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_state.dart';
import 'package:freeland/app/auth/presentation/state/app_manager_bloc/app_manager_bloc.dart';
import 'package:freeland/app/info/country/infrastrcture/data_source/remote/country_remote.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/test_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../../../../common/config/theme/src/styles.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Page pageBuilder(BuildContext context, GoRouterState state) {
    return MaterialPage<void>(
      key: state.pageKey,
      child: const SignUpScreen(),
    );
  }

  static const routePath = 'signup_screen';
  static const routeName = 'signup_screen';

  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime(2010, 8),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) =>
                getIt<SignUpBloc>(),
            child: BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
              if (state.formStatus.isFail()) {
                BotToast.showText(
                    text: state.formStatus.error ?? AppStrings.defaultErrorMsg);
              }
            }, builder: (context, state) {
              final SignUpBloc signUpBloc = context.read<SignUpBloc>();
              return ReactiveForm(
                formGroup: signUpBloc.signUpForm,
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
                            "FreeLand ",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          SizedBox(height: 10.0.h),
                          Text(
                            "Sign Up for free",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ],
                      ),
                      SizedBox(height: 50.0.h),
                      Column(
                        children: [
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            validationMessages: (control) => {
                              ValidationMessage.required: AppStrings.required,
                            },
                            labelText: "Full Name",
                            formControlName: SignUpBloc.fullNameKey,
                          ),
                          SizedBox(height: 10.0.h),
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            validationMessages: (control) => {
                              ValidationMessage.required: AppStrings.required,
                            },
                            labelText: "Email",
                            formControlName: SignUpBloc.emailKey,
                          ),
                          SizedBox(height: 10.0.h),
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            validationMessages: (control) => {
                              ValidationMessage.required: AppStrings.required,
                            },
                            labelText: "Phone Number",
                            formControlName: SignUpBloc.phoneNumberKey,
                          ),
                          SizedBox(height: 10.0.h),
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            validationMessages: (control) => {
                              ValidationMessage.required: AppStrings.required,
                            },
                            labelText: "Address",
                            formControlName: SignUpBloc.addressKey,
                          ),
                          SizedBox(height: 10.0.h),
                          DropdownSearch<int>(
                            items: const [1, 2, 3, 4, 5, 6, 7],
                            dropdownSearchDecoration: const InputDecoration(
                              labelText: "Country",
                              hintText: "country in menu mode",
                            ),
                          ),
                          SizedBox(height: 10.0.h),
                          DropdownSearch<int>(
                            items: const [
                              1,
                              2,
                              3,
                              4,
                              5,
                              6,
                              7,
                            ],
                            dropdownSearchDecoration: const InputDecoration(
                              labelText: "City",
                              hintText: "country in menu mode",
                            ),
                          ),
                          SizedBox(height: 10.0.h),
                          CustomReactiveTextField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            labelText: "Password",
                            validationMessages: (control) => {
                              ValidationMessage.required: AppStrings.required,
                            },
                            formControlName: SignUpBloc.passwordFieldKey,
                          ),
                          SizedBox(height: 10.0.h),
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
                                     // signUpBloc.add(SignUpSubmission(context));


                                    },
                                    child: const Text(
                                      "Sign Up",
                                    ),
                                  ),
                                )
                              : const CircularProgressIndicator(),
                          SizedBox(height: 4.0.h),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
