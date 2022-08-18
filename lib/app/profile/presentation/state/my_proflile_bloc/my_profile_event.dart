part of 'my_profile_bloc.dart';

@immutable
abstract class MyProfileEvent {}

class MyProfileFetched extends MyProfileEvent {}

class MyProfileStarted extends MyProfileEvent {}
