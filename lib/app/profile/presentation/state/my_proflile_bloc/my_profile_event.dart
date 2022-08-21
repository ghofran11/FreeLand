part of 'my_profile_bloc.dart';

@immutable
abstract class MyProfileEvent {}

class MyProfileFetched extends MyProfileEvent {}

class MyProfileChanged extends MyProfileEvent {
  final MyProfile profile;

  MyProfileChanged(this.profile);
}
