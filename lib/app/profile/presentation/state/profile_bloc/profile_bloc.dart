import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/infrastructur/models/sendConnectionParams.dart';
import 'package:freeland/app/profile/infrastructur/repo/profile_repo.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepoImpl _repo;

  ProfileBloc(this._repo) : super( ProfileState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is AnotherProfileFetched) {
        emit(state.copyWith(profileStatus: BlocStatus.loading()));

        (await _repo.getAnotherProfile(event.id)).fold(
            (left) => emit(
                state.copyWith(profileStatus: BlocStatus.fail(error: left))),
            (right) => {
                  emit(state.copyWith(
                      profile: right, profileStatus: BlocStatus.success()))
                });
      }

      if(event is SendConnect){
        emit(state.copyWith(connectStatus: BlocStatus.loading()));

        (await _repo.sendConnect(params:event._param)).fold(
                (left) => emit(
                state.copyWith(connectStatus: BlocStatus.fail(error: left))),
                (right) => {
              emit(state.copyWith(
                   connectStatus: BlocStatus.success()))
            });
      }
    });
  }
}
