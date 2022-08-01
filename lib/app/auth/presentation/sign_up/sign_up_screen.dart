import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_event.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_state.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/app/info/country/presentation/country_bloc/country_event.dart';
import 'package:freeland/app/info/country/presentation/country_bloc/country_state.dart';
import 'package:freeland/common/config/theme/src/colors.dart';
import 'package:freeland/common/constant/src/strings.dart';
import 'package:freeland/common/widgets/text_field.dart';
import 'package:freeland/injection/injection.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../common/config/theme/src/styles.dart';
import '../../../../generated/assets.dart';
import '../../../info/country/infrastrcture/model/country.dart';
import '../../../info/country/presentation/country_bloc/country_bloc.dart';

class SignUpScreen extends StatefulWidget {
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
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => getIt<SignUpBloc>(),
            child: BlocProvider(
              create: (context) =>
                  getIt<CountryBloc>()..add(GetAllCountryEvent()),
              child: BlocConsumer<SignUpBloc, SignUpState>(
                  listener: (context, state) {
                if (state.formStatus.isFail()) {
                  BotToast.showText(
                      text:
                          state.formStatus.error ?? AppStrings.defaultErrorMsg);
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
                              icon:const FaIcon(FontAwesomeIcons.idCard,color: AppColors.primary,size: 20,),
                            ),
                            SizedBox(height: 10.0.h),
                            CustomReactiveTextField(
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              validationMessages: (control) => {
                                ValidationMessage.required: AppStrings.required,
                              },
                              labelText: "User Name",
                              formControlName: SignUpBloc.userNameKey,
                              icon:const FaIcon(FontAwesomeIcons.idBadge,color: AppColors.primary,size: 20,),

                            ),
                            SizedBox(height: 10.0.h),
                            CustomReactiveTextField(
                              maxLines: 1,
                              validationMessages: (control) => {
                                ValidationMessage.required: AppStrings.required,
                              },
                              labelText: "Email",
                              formControlName: SignUpBloc.emailKey,
                              icon:const FaIcon(FontAwesomeIcons.pencil,color: AppColors.primary,size: 20,),

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
                              icon:const FaIcon(FontAwesomeIcons.mobileScreenButton,color: AppColors.primary,size: 20,),

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
                              icon:const FaIcon(FontAwesomeIcons.locationDot,color: AppColors.primary,size: 20,),

                            ),
                            SizedBox(height: 10.0.h),
                            ReactiveDateTimePicker(
                              formControlName: SignUpBloc.birthDayKey,
                              decoration: InputDecoration(
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
                                labelText: 'Date of Birth',
                                icon:const FaIcon(FontAwesomeIcons.calendarDays,color: AppColors.primary,size: 20,),

                              ),
                            ),
                            SizedBox(height: 10.0.h),
                            BlocConsumer<CountryBloc, CountryState>(
                                listener: (context, state) {
                              if (state.formStatus.isFail()) {
                                BotToast.showText(
                                    text: state.formStatus.error ??
                                        AppStrings.defaultErrorMsg);
                              }
                            }, builder: (context, state) {
                              final CountryBloc countryBloc =
                                  context.read<CountryBloc>();

                              if (state.formStatus.isSuccess()) {
                                List<CountryDto> _countries =
                                    countryBloc.countries;

                                return ReactiveDropdownSearch<CountryDto,
                                    CountryDto>(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    labelText: 'Country',
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: borderRadiusCircular,
                                      borderSide: BorderSide(
                                          style: BorderStyle.none,
                                          width: 2.0.r),
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: borderRadiusCircular,
                                      borderSide: BorderSide(
                                          width: 1.0.r,
                                          style: BorderStyle.none),
                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                    icon:const FaIcon(FontAwesomeIcons.flag,color: AppColors.primary,size: 20,),

                                  ),
                                  mode: Mode.MENU,
                                  formControlName: SignUpBloc.countryKey,
                                  items: _countries,
                                  itemAsString: (CountryDto? u) => u!.name,
                                  onBeforeChange: (prev, next) async {
                                    signUpBloc.add(CountrySelected(
                                        country: next as CountryDto));
                                    return true;
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            }),
                            SizedBox(height: 10.0.h),
                            if (state.countrySelected != null)
                              ReactiveDropdownSearch<CityDto, CityDto>(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: borderRadiusCircular,
                                      borderSide: BorderSide(
                                          style: BorderStyle.none,
                                          width: 2.0.r),
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: borderRadiusCircular,
                                      borderSide: BorderSide(
                                          width: 1.0.r,
                                          style: BorderStyle.none),

                                    ),
                                    filled: true,
                                    fillColor: AppColors.white,
                                    icon:const FaIcon(FontAwesomeIcons.building,color: AppColors.primary,size: 20,),
                                    labelText: 'City'),
                                mode: Mode.MENU,
                                formControlName: SignUpBloc.cityKey,
                                items: (signUpBloc.signUpForm
                                        .control(SignUpBloc.countryKey)
                                        .value as CountryDto)
                                    .cityDtos,
                                itemAsString: (CityDto? u) => u!.name,
                              ),
                            SizedBox(height: 10.0.h),
                            CustomReactiveTextField(
                              //icon: const Icon(Icons.lock,color: AppColors.primary,) ,

                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              labelText: "Password",
                              obscureText: true,
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
                                        signUpBloc
                                            .add(SignUpSubmission(context));
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
      ),
    );
  }
}
