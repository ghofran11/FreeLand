part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final BlocStatus profileStatus;

  final MyProfile? profile;

  final BlocStatus connectStatus;

   ProfileState({
  this.connectStatus=const  BlocStatus(),
    this.profileStatus = const BlocStatus(),
    this.profile,

  });

  ProfileState copyWith({MyProfile? profile, BlocStatus? profileStatus,BlocStatus? connectStatus}) {
    return ProfileState(
        profile: profile ?? this.profile,
        profileStatus: profileStatus ?? this.profileStatus,
      connectStatus:  connectStatus ?? this.connectStatus
    );
  }

  @override
  List<Object?> get props => [profileStatus, profile,connectStatus];
}
