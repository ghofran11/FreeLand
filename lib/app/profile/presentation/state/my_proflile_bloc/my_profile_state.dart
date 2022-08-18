part of 'my_profile_bloc.dart';

class MyProfileState extends Equatable {
  final BlocStatus profileStatus;
  final BlocStatus connectStatus;

  final MyProfile? profile;

  const MyProfileState({
    this.profileStatus = const BlocStatus(),
    this.profile,
    this.connectStatus=const BlocStatus()
  });

  MyProfileState copyWith({MyProfile? profile, BlocStatus? profileStatus,BlocStatus? connectStatus}) {
    return MyProfileState(
        profile: profile ?? this.profile,
        profileStatus: profileStatus ?? this.profileStatus,
      connectStatus: connectStatus ?? this.connectStatus
    );

  }

  @override
  List<Object?> get props => [profileStatus, profile,connectStatus];
}
