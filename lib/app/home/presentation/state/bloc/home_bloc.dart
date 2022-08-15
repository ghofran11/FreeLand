import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/home/infrastructure/repo/home_repository_impl.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:freeland/core/result_builder/result.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<CategoryDto> categories = [];
  List<ServiceDto> services = [];
  late final HomeRepositoryImpl _homeRepositoryImpl;

  HomeBloc(HomeRepositoryImpl homeRepositoryImpl) : super(const HomeState()) {
    _homeRepositoryImpl = homeRepositoryImpl;
    on<HomeEvent>((event, emit) async {
      if (event is FetchAllCategory) {
        emit(state.copyWith(categoryStatus: BlocStatus.loading()));


        (await _homeRepositoryImpl.fetchAllCategory()).fold(
            (left) => emit(
                state.copyWith(categoryStatus: BlocStatus.fail(error: left))),
            (right) => {
                  categories = right,
                  emit(state.copyWith(categoryStatus: BlocStatus.success())),
                  add(FetchAllService(id: right[0].id))
                });
      }
      if (event is FetchAllService) {
        emit(state.copyWith(serviceStatus: BlocStatus.loading()));

        (await _homeRepositoryImpl.fetchAllServices(event.id)).fold(
            (left) => emit(
                state.copyWith(serviceStatus: BlocStatus.fail(error: left))),
            (right) => {
                  services = right,
                  emit(state.copyWith(serviceStatus: BlocStatus.success()))
                });
      }
    });
  }
}
