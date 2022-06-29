import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/auth/domain/entities/login_params.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:freeland/injection/injection.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late final AuthRepository _authRepository;

  final loginForm = FormGroup(
    {
      emailKey: FormControl<String>(validators: [
        Validators.required,
      ]),
      rememberMeKey: FormControl<bool>(validators: []),
      passwordFieldKey: FormControl<String>(validators: [
        Validators.required,
      ]),
    },
  );

  LoginBloc() : super(LoginState()) {
    _authRepository = getIt<AuthRepository>();
    on<LoginEvent>((event, emit) async {
      if (event is LoginSubmission) {
        if (loginForm.valid) {
          debugPrint(state.getLoginParams(loginForm).toString());
          await submission(emit);
        } else {
          loginForm.markAllAsTouched();
        }
      } else if (event is LoginSkipped) {
        await _skip(emit, event.context);
      }
    });
  }

  submission(Emitter emit) async {
    emit(state.copyWith(formState: BlocStatus.loading()));

    (await _authRepository.login(params: await state.getLoginParams(loginForm)))
        .fold(
      (left) => emit(state.copyWith(formState: BlocStatus.fail(error: left))),
      (right) {},
    );
  }

  Future<void> _skip(Emitter emit, BuildContext context) async {
    emit(state.copyWith(formState: BlocStatus.loading()));

    (await _authRepository.login(params: const LoginParams.skip())).fold(
      (left) => emit(state.copyWith(formState: BlocStatus.fail(error: left))),
      (right) {},
    );
  }

  static bool buildWhen(LoginState pre, LoginState next) {
    final nextFormStatus = next.formStatus;
    if (((!nextFormStatus.isSuccess()))) {
      return true;
    }
    return false;
  }

  static const emailKey = "emailKey";
  static const passwordFieldKey = "passwordFieldKey";
  static const rememberMeKey = "rememberMeKey";
}
