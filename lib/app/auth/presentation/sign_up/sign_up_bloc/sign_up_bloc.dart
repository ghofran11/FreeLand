import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_event.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_state.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late final AuthRepository _authRepository;

  var signUpForm = FormGroup(
    {
      fullNameKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      userNameKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      addressKey: FormControl<String>(validators: [
        Validators.required,
      ]),
      phoneNumberKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      emailKey: FormControl<String>(
          validators: [Validators.required, Validators.email]),
      passwordFieldKey: FormControl<String>(
          validators: [Validators.required, Validators.minLength(8)]),
      birthDayKey: FormControl<DateTime>(validators: [
        Validators.required,
      ]),
      countryKey: FormControl<CountryDto>(validators: [
        Validators.required,
      ]),
      cityKey: FormControl<CityDto>(validators: [
        Validators.required,
      ]),
    },
  );

  SignUpBloc(AuthRepository authRepository) : super(SignUpState()) {
    _authRepository = authRepository;
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpSubmission) {
        if (signUpForm.valid) {
          debugPrint((await state.getSignUpParams(signUpForm, event.context))
              .toString());
          await submission(emit, event.context);
        } else {
          signUpForm.markAllAsTouched();
        }
      } else if (event is CountrySelected) {
        emit(state.copyWith(countrySelected: event.country));
      }
    });
  }

  submission(Emitter emit, BuildContext context) async {
    emit(state.copyWith(formState: BlocStatus.loading()));
    (await _authRepository.signUp(
            params: await state.getSignUpParams(signUpForm, context)))
        .fold(
            (left) =>
                emit(state.copyWith(formState: BlocStatus.fail(error: left))),
            (right) => {});
  }

  static const fullNameKey = "fullNameKey";
  static const userNameKey = "userNameKey";
  static const phoneNumberKey = "phoneNumberKey";
  static const addressKey = "addressKey";
  static const emailKey = "emailKey";
  static const passwordFieldKey = "passwordFieldKey";
  static const birthDayKey = "birthDayKey";
  static const countryKey = "countryKey";
  static const cityKey = "cityKey";
}
