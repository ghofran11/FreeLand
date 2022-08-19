import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/projects/domain/entities/my_projects.dart';
import 'package:freeland/app/projects/infrastructure/models/comment_offer.dart';
import 'package:freeland/app/projects/infrastructure/repo/project_repository_impl.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  late final ProjectRepositoryImpl _projectRepositoryImpl;
  var offerForm = FormGroup({
    descKey: FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    priceKey: FormControl<int>(
      validators: [
        Validators.required,
      ],
    ),
  });
  List<CommentOfferDto> comments = [];
  MyProjects? myProjects;

  ProjectBloc(ProjectRepositoryImpl projectRepositoryImpl)
      : super(ProjectState()) {
    _projectRepositoryImpl = projectRepositoryImpl;
    on<ProjectEvent>((event, emit) async {
      if (event is OfferSubmission) {
        if (offerForm.valid) {
          emit(state.copyWith(offerState: BlocStatus.loading()));
          (await _projectRepositoryImpl.sendOffer(
                  params:
                      await state.getOfferParams(offerForm, event.projectId)))
              .fold(
                  (left) => emit(
                      state.copyWith(offerState: BlocStatus.fail(error: left))),
                  (right) =>
                      emit(state.copyWith(offerState: BlocStatus.success())));
        } else {
          offerForm.markAllAsTouched();
        }
      }
      if (event is CommentSubmission) {
        emit(state.copyWith(commentState: BlocStatus.loading()));
        (await _projectRepositoryImpl.sendComment(
                params:
                    await state.getCommentParams(event.projectId, event.msg)))
            .fold(
                (left) => emit(
                    state.copyWith(commentState: BlocStatus.fail(error: left))),
                (right) =>
                    emit(state.copyWith(commentState: BlocStatus.success())));
      }
      if (event is FetchAllComments) {
        emit(state.copyWith(fetchAllCommentState: BlocStatus.loading()));

        (await projectRepositoryImpl.fetchAllComment(
                serviceId: event.projectId))
            .fold(
                (left) => emit(state.copyWith(
                    fetchAllCommentState: BlocStatus.fail(error: left))),
                (right) => {
                      comments = right,
                      emit(state.copyWith(
                          fetchAllCommentState: BlocStatus.success()))
                    });
      }
      if (event is FetchMyProjects) {
        emit(state.copyWith(fetchMyProjectsStatus: BlocStatus.loading()));

        (await projectRepositoryImpl.fetchMyProjects()).fold(
          (left) => emit(state.copyWith(
              fetchMyProjectsStatus: BlocStatus.fail(error: left))),
          (right) => {
            myProjects = right,
            emit(state.copyWith(fetchMyProjectsStatus: BlocStatus.success()))
          },
        );
      }
    });
  }

  static const descKey = "descKey";
  static const priceKey = "priceKey";
}
