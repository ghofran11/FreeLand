import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeland/app/profile/infrastructur/data_source/profile_remote.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/app/profile/infrastructur/repo/profile_repo.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/dio/dio_client.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:meta/meta.dart';

part 'my_profile_event.dart';
part 'my_profile_state.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  /// Wait [getIt] injection before read AuthRepo implementation from service locator
  // final ProfileRepoImpl Function() lazyRepository;

  /// Do some initiation before close splash and open app
  // final FutureOr<void> Function()? doBeforeOpen;

  final ProfileRepoImpl _repo = ProfileRepoImpl(ProfileRemote(
    DioClient(
      AppUri.baseUrlDevelopment + "api/",
    ),
  ));

  MyProfileBloc() : super(const MyProfileState()) {
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
    });
  }
}
