import 'package:flutter/material.dart';
import 'package:freeland/app/projects/domain/entities/add_project_params.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';
import 'package:freeland/app/projects/presentation/state/bloc/project_bloc.dart';
import 'package:freeland/core/bloc_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProjectState {
  final BlocStatus offerSubmission;
  final BlocStatus commentSubmission;
  final BlocStatus projectSubmission;
  final BlocStatus fetchAllComment;
  final BlocStatus fetchMyProjectsStatus;

  ProjectState(
      {this.offerSubmission = const BlocStatus(),
      this.commentSubmission = const BlocStatus(),
      this.fetchAllComment = const BlocStatus(),
      this.fetchMyProjectsStatus = const BlocStatus(),
      this.projectSubmission = const BlocStatus()});

  ProjectState copyWith({
    BlocStatus? offerState,
    BlocStatus? commentState,
    BlocStatus? fetchAllCommentState,
    BlocStatus? projectSubmission,
    BlocStatus? fetchMyProjectsStatus,
  }) {
    return ProjectState(
        offerSubmission: offerState ?? offerSubmission,
        commentSubmission: commentState ?? commentSubmission,
        fetchAllComment: fetchAllCommentState ?? fetchAllComment,
        fetchMyProjectsStatus:
            fetchMyProjectsStatus ?? this.fetchMyProjectsStatus,
        projectSubmission: projectSubmission ?? this.projectSubmission);
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
    return "offerSubmission: $offerSubmission,commentSubmission: $commentSubmission,projectSubmission : $projectSubmission";
  }

  Future<AddProjectParams> getAddProjectParams(
      FormGroup addProjectForm, BuildContext context) async {
    return AddProjectParams(
      name: addProjectForm.control(ProjectBloc.projectNameKey).value,
      description: addProjectForm.control(ProjectBloc.projectDescKey).value,
      minPrice: addProjectForm.control(ProjectBloc.minSalaryKey).value,
      maxPrice: addProjectForm.control(ProjectBloc.maxSalaryKey).value,
      documentDto: DocumentDto(name: '', id: '', type: 2, path: ''),
    );
  }
}
