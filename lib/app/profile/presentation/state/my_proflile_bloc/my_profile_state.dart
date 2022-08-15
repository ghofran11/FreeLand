part of 'my_profile_bloc.dart';

class MyProfileState extends Equatable {
  final BlocStatus profileStatus;

  final MyProfile? profile;

  const MyProfileState({this.profileStatus = const BlocStatus(), this.profile});

  MyProfileState copyWith({MyProfile? profile, BlocStatus? profileStatus}) {
    return MyProfileState(
        profile: profile ?? this.profile,
        profileStatus: profileStatus ?? this.profileStatus);
  }

  @override
  List<Object?> get props => [profileStatus, profile];
}
