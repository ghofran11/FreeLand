import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/result_builder/result.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is AdsGotHome) {
        await adsGot(event, emit);
      }
    });
  }

  adsGot(AdsGotHome event, Emitter emit) async {
    emit(state.copyWith(resultAds: const Result.loading()));
  }
}
