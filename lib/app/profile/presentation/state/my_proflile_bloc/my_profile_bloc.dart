import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/infrastructur/repo/profile_repo.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:meta/meta.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  /// Wait [getIt] injection before read AuthRepo implementation from service locator
  final ProfileRepoImpl Function() lazyRepository;

  /// Do some initiation before close splash and open app
  final FutureOr<void> Function()? doBeforeOpen;

  late ProfileRepoImpl _repo;

  MyProfileBloc({required this.lazyRepository, this.doBeforeOpen})
      : super(const MyProfileState()) {
    on<MyProfileEvent>((event, emit) async {
      if (event is MyProfileFetched) {
        emit(state.copyWith(profileStatus: BlocStatus.loading()));

        (await _repo.getMyProfile()).fold(
            (left) => emit(
                state.copyWith(profileStatus: BlocStatus.fail(error: left))),
            (right) => {
                  emit(state.copyWith(
                      profile: right, profileStatus: BlocStatus.success()))
                });
      }

      if (event is SendConnect) {
        emit(state.copyWith(connectStatus: BlocStatus.loading()));

        (await _repo.sendConnect()).fold(
            (left) => emit(
                state.copyWith(connectStatus: BlocStatus.fail(error: left))),
            (right) =>
                emit(state.copyWith(connectStatus: BlocStatus.success())));
      }
      if (event is MyProfileStarted) {
        try {
          await doBeforeOpen?.call();
        } catch (_) {}
        _repo = lazyRepository();
      }
    });
  }
}
