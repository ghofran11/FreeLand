
class ProjectEvent{
  const ProjectEvent();
}
class OfferSubmission extends ProjectEvent{
final   String projectId;

  OfferSubmission({required this.projectId});
}

class CommentSubmission extends ProjectEvent{
  final   String projectId;
  final   String  msg;

  CommentSubmission({required this.projectId,required,required this.msg });

}
class FetchAllComments extends ProjectEvent{
  final   String projectId;

  FetchAllComments({required this.projectId});
}