import 'package:flutter/material.dart';

class ProjectEvent {
  const ProjectEvent();
}

class OfferSubmission extends ProjectEvent {
  final String projectId;

  OfferSubmission({required this.projectId});
}

class CommentSubmission extends ProjectEvent {
  final String projectId;
  final String msg;

  CommentSubmission({required this.projectId, required, required this.msg});
}

class FetchAllComments extends ProjectEvent {
  final String projectId;

  FetchAllComments({required this.projectId});
}

class ProjectSubmission extends ProjectEvent {
  final BuildContext context;

  ProjectSubmission(this.context);
}

class FetchMyProjects extends ProjectEvent {
  FetchMyProjects();
}

class AddContract extends ProjectEvent {
  final String freelancerId;
  final String projectId;

  const AddContract({required this.freelancerId, required this.projectId});
}
class FetchDetailProjects extends ProjectEvent {
  String idProject;
  FetchDetailProjects({required this.idProject});
}

class PartResponsed extends ProjectEvent {
  final String partId;
  final double? evaluation;

  const PartResponsed({
    required this.partId,
    this.evaluation,
  });
}

class PartSubmitted extends ProjectEvent {
  final String partId;

  const PartSubmitted({
    required this.partId,
  });
}
