import 'package:flutter/foundation.dart';

@immutable
abstract class FormStatus {
  const FormStatus();
}

class EditingFormStatus extends FormStatus {
  const EditingFormStatus();

  @override
  String toString() {
    return "EditingFormStatus";
  }
}

class InitFormStatus extends FormStatus {
  const InitFormStatus();

  @override
  String toString() {
    return "InitFormStatus";
  }
}

class LoadingFormStatus extends FormStatus {
  const LoadingFormStatus();

  @override
  String toString() {
    return "LoadingFormStatus";
  }
}

class ErrorFormStatus extends FormStatus {
  final String? errorMessage;

  const ErrorFormStatus({this.errorMessage});

  @override
  String toString() {
    return "ErrorFormStatus:  " + (errorMessage ?? "");
  }
}
