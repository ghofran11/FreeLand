import 'package:flutter/material.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/projects/domain/entities/add_project_params.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/common/widgets/image_holder/image_file.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProjectState {
  final BlocStatus offerSubmission;
  final BlocStatus commentSubmission;
  final BlocStatus projectSubmission;
  final BlocStatus fetchAllComment;
  final BlocStatus addContract;
  final BlocStatus fetchMyProjectsStatus;
  final BlocStatus fetchDetailProject;


  ProjectState(
      {this.offerSubmission = const BlocStatus(),
      this.commentSubmission = const BlocStatus(),
      this.fetchAllComment = const BlocStatus(),
      this.addContract = const BlocStatus(),
      this.fetchMyProjectsStatus = const BlocStatus(),
      this.projectSubmission = const BlocStatus(),
        this.fetchDetailProject=const BlocStatus()
      });

  ProjectState copyWith({
    BlocStatus? offerState,
    BlocStatus? commentState,
    BlocStatus? fetchAllCommentState,
    BlocStatus? projectSubmission,
    BlocStatus? fetchMyProjectsStatus,
    BlocStatus? addContractStatus,
    BlocStatus? fetchDetailProject
  }) {
    return ProjectState(
      offerSubmission: offerState ?? offerSubmission,
      commentSubmission: commentState ?? commentSubmission,
      fetchAllComment: fetchAllCommentState ?? fetchAllComment,
      projectSubmission: projectSubmission ?? this.projectSubmission,
      addContract: addContractStatus ?? this.addContract,
      fetchMyProjectsStatus:
          fetchMyProjectsStatus ?? this.fetchMyProjectsStatus,
      fetchDetailProject: fetchDetailProject?? this.fetchDetailProject
    );
  }

  Future<OfferParams> getOfferParams(
      FormGroup offerForm, String projectId) async {
    return OfferParams(
      serviceId: projectId,
      text: offerForm.control(ProjectBloc.descKey).value,
      price: offerForm.control(ProjectBloc.priceKey).value,
    );
  }

  Future<CommentParams> getCommentParams(String projectId, dynamic msg) async {
    return CommentParams(
        parentCommentId: null,
        text: msg,
        serviceId: projectId,
        //Todo: Ask Caroline
        offerId: 0);
  }

  @override
  String toString() {
    return "offerSubmission: $offerSubmission,commentSubmission: $commentSubmission,projectSubmission : $projectSubmission, fetchMyProjectsStatus: $fetchMyProjectsStatus, fetchDetailProject :$fetchDetailProject";
  }

  Future<AddProjectParams> getAddProjectParams(
      FormGroup addProjectForm, BuildContext context) async {
    return AddProjectParams(
      name: addProjectForm.control(ProjectBloc.projectNameKey).value,
      deadLine: addProjectForm.control(ProjectBloc.projectDeadlineKey).value,
      description: addProjectForm.control(ProjectBloc.projectDescKey).value,
      minPrice: addProjectForm.control(ProjectBloc.minSalaryKey).value,
      maxPrice: addProjectForm.control(ProjectBloc.maxSalaryKey).value,
      categoriesIds: (addProjectForm.control(ProjectBloc.categoryKey).value
              as List<CategoryDto2>)
          .map((e) => e.id)
          .toList(),
      image: (addProjectForm.control(ProjectBloc.imageKey).value as ImageFile)
          .image,
    );
  }
}
