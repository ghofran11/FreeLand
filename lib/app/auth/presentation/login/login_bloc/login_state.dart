part of 'login_bloc.dart';

class LoginState {
  final BlocStatus formStatus;

  LoginState({
    this.formStatus = const BlocStatus(),
  });

  LoginState copyWith(
      {BlocStatus? formState,}) {
    return LoginState(
      formStatus: formState ?? formStatus,
    );
  }

  Future<LoginParams> getLoginParams(
      FormGroup loginForm, BuildContext context) async {
    String token = await getIt<FirebaseNotificationService>().getToken() ?? " ";
    return LoginParams(
      deviceToken: token,
      email: loginForm.control(LoginBloc.emailKey).value,
      password: loginForm.control(LoginBloc.passwordFieldKey).value,
    );
  }

  @override
  String toString() {
    return formStatus.toString();
  }
}
