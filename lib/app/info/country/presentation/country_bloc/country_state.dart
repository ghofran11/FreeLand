import 'package:freeland/core/bloc_status.dart';

 class CountryState{

  late final BlocStatus formStatus;

  CountryState copyWith(
      {BlocStatus? formState,}) {
   return CountryState(
    formStatus: formState ?? formStatus,
   );
  }

  CountryState({this.formStatus = const BlocStatus(),});
}