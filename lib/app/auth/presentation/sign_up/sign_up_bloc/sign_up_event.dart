
import 'package:flutter/cupertino.dart';

class SignUpEvent{
  const SignUpEvent();
}
class SignUpSubmission extends SignUpEvent {
  final BuildContext context;
  const SignUpSubmission(this.context);
}

class CountriesFetched extends SignUpEvent {
  const CountriesFetched();
}