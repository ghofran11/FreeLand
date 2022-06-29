part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent();
}

class LoginSubmission extends LoginEvent {
  const LoginSubmission();
}

class LoginStarted extends LoginEvent {
  final String locale;
  const LoginStarted(this.locale);
}

class LoginSkipped extends LoginEvent {
  final BuildContext context;
  const LoginSkipped(this.context);
}
