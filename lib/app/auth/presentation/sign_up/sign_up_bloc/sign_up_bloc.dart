

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_event.dart';
import 'package:freeland/app/auth/presentation/sign_up/sign_up_bloc/sign_up_state.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:freeland/injection/injection.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../domain/entities/sign_up_params.dart';

class SignUpBloc extends Bloc<SignUpEvent,SignUpState>{

  late final AuthRepository _authRepository;

  final signUpForm = FormGroup(
    {
      fullNameKey:FormControl<String>(validators: [
        Validators.required,
      ]),
      addressKey:FormControl<String>(validators: [
        Validators.required,
      ]),
      phoneNumberKey:FormControl<String>(validators: [
        Validators.required,
      ],),
      emailKey: FormControl<String>(validators: [
        Validators.required,Validators.email
      ]),
      passwordFieldKey: FormControl<String>(validators: [
        Validators.required,Validators.minLength(8)
      ]),
    },
  );

  SignUpBloc(AuthRepository authRepository ) : super(SignUpState()){
    _authRepository =authRepository;
    on<SignUpEvent>((event, emit) async {
      if (event is SignUpSubmission) {
        if (signUpForm.valid) {
          debugPrint((await state.getSignUpParams(signUpForm, event.context))
              .toString());
          await submission(emit, event.context);
        } else {
          signUpForm.markAllAsTouched();
        }
      }
    });
  }
  submission(Emitter emit, BuildContext context) async {
    emit(state.copyWith(formState: BlocStatus.loading()));
    (await _authRepository.signUp(
        params:await state.getSignUpParams(signUpForm, context)));



  }

  static const fullNameKey="fullNameKey";
  static const phoneNumberKey="phoneNumberKey";
  static const addressKey="addressKey";
  static const emailKey = "emailKey";
  static const passwordFieldKey = "passwordFieldKey";




}