part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final BlocStatus profileStatus;

  final MyProfile? profile;

  const ProfileState({this.profileStatus = const BlocStatus(), this.profile});

  ProfileState copyWith({MyProfile? profile, BlocStatus? profileStatus}) {
    return ProfileState(
        profile: profile ?? this.profile,
        profileStatus: profileStatus ?? this.profileStatus);
  }

  @override
  List<Object?> get props => [profileStatus, profile];
}
