part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class AnotherProfileFetched extends ProfileEvent {
  final String id;

  AnotherProfileFetched(this.id);
}
class SendConnect extends ProfileEvent {
  final SendConnectionParam _param;

  SendConnect(this._param);
}
