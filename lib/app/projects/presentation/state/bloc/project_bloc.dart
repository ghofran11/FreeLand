import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/contract/contract_add_param.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/projects/domain/entities/my_projects.dart';
import 'package:freeland/app/projects/infrastructure/models/comment_offer.dart';
import 'package:freeland/app/projects/infrastructure/models/deatail_service_dto.dart';
import 'package:freeland/app/projects/infrastructure/repo/project_repository_impl.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_event.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_state.dart';
import 'package:freeland/common/widgets/image_holder/image_file.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  late final ProjectRepositoryImpl _projectRepositoryImpl;
  late DetailServiceDto detailServices;
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

  var addProjectForm = FormGroup(
    {
      projectNameKey: FormControl<String>(
        validators: [
          Validators.required,
        ],
      ),
      projectDeadlineKey: FormControl<DateTime>(
        validators: [
          Validators.required,
        ],
      ),
      projectDescKey: FormControl<String>(validators: [
        Validators.required,
      ]),
      minSalaryKey: FormControl<int>(
        validators: [
          Validators.required,
        ],
      ),
      maxSalaryKey: FormControl<int>(validators: [
        Validators.required,
      ]),
      imageKey: FormControl<ImageFile>(validators: []),
      categoryKey: FormControl<List<CategoryDto2>>(validators: []),
    },
  );

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

      if (event is ProjectSubmission) {
        if (addProjectForm.valid) {
          await submission(emit, event.context);
        } else {
          addProjectForm.markAllAsTouched();
        }
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
      if (event is AddContract) {
        emit(state.copyWith(addContractStatus: BlocStatus.loading()));
        (await _projectRepositoryImpl.addContract(getContractParams(event)))
            .fold(
                (left) => emit(state.copyWith(
                    addContractStatus: BlocStatus.fail(error: left))),
                (right) => emit(
                    state.copyWith(addContractStatus: BlocStatus.success())));
      }

      if (event is FetchDetailProjects) {
        emit(state.copyWith(fetchDetailProject: BlocStatus.loading()));

        (await projectRepositoryImpl.fetchDetailServices(
                projectId: event.idProject))
            .fold(
          (left) => emit(
              state.copyWith(fetchDetailProject: BlocStatus.fail(error: left))),
          (right) => {
            detailServices = right,
            emit(state.copyWith(fetchDetailProject: BlocStatus.success()))
          },
        );
      }
      if (event is PartSubmitted) {
        emit(state.copyWith(partStatus: BlocStatus.loading()));
        (await _projectRepositoryImpl.submitPart(event.partId)).fold(
            (left) =>
                emit(state.copyWith(partStatus: BlocStatus.fail(error: left))),
            (right) => emit(state.copyWith(partStatus: BlocStatus.success())));
      }
      if (event is PartResponsed) {
        emit(state.copyWith(partStatus: BlocStatus.loading()));
        (await _projectRepositoryImpl.responsePart(event.partId)).fold(
            (left) =>
                emit(state.copyWith(partStatus: BlocStatus.fail(error: left))),
            (right) => emit(state.copyWith(partStatus: BlocStatus.success())));
      }

      if(event is ResponseOffer){
        emit(state.copyWith(responseOffer: BlocStatus.loading()));

        (await _projectRepositoryImpl.responseOffer(params:event.param)).fold(
                (left) => emit(
                state.copyWith(responseOffer: BlocStatus.fail(error: left))),
                (right) => {
              emit(state.copyWith(
                  responseOffer: BlocStatus.success()))
            });

      }
    });
  }

  submission(Emitter emit, BuildContext context) async {
    emit(state.copyWith(projectSubmission: BlocStatus.loading()));
    (await _projectRepositoryImpl.addProject(
            params: await state.getAddProjectParams(addProjectForm, context)))
        .fold(
            (left) => emit(state.copyWith(
                projectSubmission: BlocStatus.fail(error: left))),
            (right) => {
                  emit(state.copyWith(projectSubmission: BlocStatus.success()))
                });
  }

  static const descKey = "descKey";

  static const priceKey = "priceKey";

  static const projectNameKey = "projectNameKey";
  static const projectDeadlineKey = "projectDeadlineKey";
  static const projectDescKey = "projectDescKey";
  static const minSalaryKey = "minSalaryKey";
  static const maxSalaryKey = "maxSalaryKey";
  static const imageKey = "imageKey";
  static const categoryKey = "categoryKey";

  ///Contract
  ///
  final contractForm = FormGroup(
    {
      'desc': FormControl<String>(validators: [
        Validators.required,
      ]),
      'levels': FormControl<int>(validators: [
        Validators.required,
        Validators.number,
      ]),
      'deadline_support': FormControl<DateTime>(validators: [
        Validators.required,
      ]),
      'deadline': FormControl<DateTime>(validators: [
        Validators.required,
      ]),
      'price': FormControl<int>(validators: [
        Validators.required,
        Validators.number,
      ]),
    },
  );

  // an array of groups
  final levelsForm = FormGroup({'levelsArray': FormArray([])});

  getContractParams(AddContract event) {
    return AddContractParam(
      serviceId: event.projectId,
      freeLancerId: event.freelancerId,
      description: contractForm.control('desc').value as String,
      deadLineSupport:
          contractForm.control('deadline_support').value as DateTime,
      totalPrice: contractForm.control('price').value as int,
      deadLine: contractForm.control('deadline').value as DateTime,
      partDtos2: List.generate(
          (levelsForm.control('levelsArray') as FormArray).controls.length,
          (index) {
        final FormGroup thisLeveFormGroup =
            (levelsForm.control('levelsArray') as FormArray).controls[index]
                as FormGroup;
        return PartDto2(
          order: thisLeveFormGroup.control('order').value as int,
          deadLine: thisLeveFormGroup.control('deadLine').value as DateTime?,
          price: thisLeveFormGroup.control('price').value as int,
          description: thisLeveFormGroup.control('description').value as String,
        );
      }),
    );
  }
}
