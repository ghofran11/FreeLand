import 'package:bloc/bloc.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/commom_question.dart';
import 'package:freeland/app/home/infrastructure/models/contact_us_params.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/app/home/infrastructure/repo/home_repository_impl.dart';
import 'package:freeland/common/widgets/image_holder/image_file.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<CategoryDto> categories = [];
  List<ServiceDto> services = [];
  List<UserDto> users = [];
  List<CommonQuestionModel> commonQuestions = [];
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
                  add(FetchAllService(id: right[0].id)),
                  emit(state.copyWith(categoryStatus: BlocStatus.success())),
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
      if (event is FetchAllUser) {
        emit(state.copyWith(userStatus: BlocStatus.loading()));

        (await _homeRepositoryImpl.fetchAllUsers()).fold(
            (left) =>
                emit(state.copyWith(userStatus: BlocStatus.fail(error: left))),
            (right) => {
                  users = right,
              print(users),
              print('ghofran ghofran '),
                  emit(state.copyWith(userStatus: BlocStatus.success())),
                });
      }
      if (event is CommonQuestionsFetched) {
        emit(state.copyWith(commonQuestionsStatus: BlocStatus.loading()));

        (await _homeRepositoryImpl.fetchAllCommonQuestions()).fold(
            (left) => emit(state.copyWith(
                commonQuestionsStatus: BlocStatus.fail(error: left))),
            (right) => {
                  commonQuestions = right,
                  emit(state.copyWith(
                      commonQuestionsStatus: BlocStatus.success()))
                });
      }
      if (event is ContactUSSubmitted) {
        print(form.control('photo').value.runtimeType);
        if (form.valid) {
          emit(state.copyWith(contactUsStatus: BlocStatus.loading()));

          (await _homeRepositoryImpl.contactUs(
            ContactUSModel(
              image: (form.control('photo').value as ImageFile).image,
              title: form.control('title').value,
              description: form.control('msg').value,
            ),
          ))
              .fold(
                  (left) => emit(state.copyWith(
                      contactUsStatus: BlocStatus.fail(error: left))),
                  (right) => {
                        emit(state.copyWith(
                            contactUsStatus: BlocStatus.success()))
                      });
        } else {
          form.markAllAsTouched();
        }
      }
    });
  }

  final form = FormGroup(
    {
      'title': FormControl<String>(validators: [
        Validators.required,
      ]),
      'msg': FormControl<String>(validators: [
        Validators.required,
      ]),
      'photo': FormControl<ImageFile>(validators: []),
    },
  );

  fetchAllServices(categoryId, Emitter emit) async {
    emit(state.copyWith(serviceStatus: BlocStatus.loading()));

    (await _homeRepositoryImpl.fetchAllServices(categoryId)).fold(
        (left) =>
            emit(state.copyWith(serviceStatus: BlocStatus.fail(error: left))),
        (right) => {
              services = right,
              emit(state.copyWith(serviceStatus: BlocStatus.success()))
            });
  }
}
