import 'package:flutter/cupertino.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_bloc.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:freeland/injection/injection.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../domain/entities/sign_up_params.dart';

class SignUpState {
  final BlocStatus formStatus;
  CountryDto? countrySelected;

  SignUpState({
    this.formStatus = const BlocStatus(),
    this.countrySelected,
  });

  SignUpState copyWith({BlocStatus? formState, CountryDto? countrySelected}) {
    return SignUpState(
      formStatus: formState ?? formStatus,
      countrySelected: countrySelected ?? countrySelected,
    );
  }

  Future<SignUpParams> getSignUpParams(
      FormGroup signUpForm, BuildContext context) async {
    String token = await getIt<FirebaseNotificationService>().getToken() ?? " ";
    return SignUpParams(
      deviceToken: token,
      fullName: signUpForm.control(SignUpBloc.fullNameKey).value,
      password: signUpForm.control(SignUpBloc.passwordFieldKey).value,
      phoneNumber: signUpForm.control(SignUpBloc.phoneNumberKey).value,
      email: signUpForm.control(SignUpBloc.emailKey).value,
      address: signUpForm.control(SignUpBloc.addressKey).value,
      countryId: signUpForm.control(SignUpBloc.countryKey).value,
      cityId: signUpForm.control(SignUpBloc.cityKey).value,
      bDay: signUpForm.control(SignUpBloc.birthDayKey).value,
    );
  }
}
