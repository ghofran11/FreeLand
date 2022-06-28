import 'package:flutter/cupertino.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';

class SignUpEvent {
  const SignUpEvent();
}

class SignUpSubmission extends SignUpEvent {
  final BuildContext context;

  const SignUpSubmission(this.context);
}

class CountriesFetched extends SignUpEvent {
  const CountriesFetched();
}

class CountrySelected extends SignUpEvent {
  final CountryDto country;

  const CountrySelected({required this.country});
}
