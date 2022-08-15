class CommentParams {
  String? parentCommentId;
  String text;
 String serviceId;
  int offerId;

  CommentParams({required this.parentCommentId,required this.text,required this.serviceId,required this.offerId});
  CommentParams coptWith({
    String? parentCommentId,
    String? text,
    String? serviceId,
    int? offerId,
  }) {
    return CommentParams(
        parentCommentId: parentCommentId?? this.parentCommentId,
        text: text??this.text,
        serviceId: serviceId??this.serviceId,
        offerId: offerId??this.offerId
    );
  }
  Future<Map<String,dynamic>> toJson()async{
    return{
      'parentCommentId':parentCommentId,
      'text':text,
      'serviceId':serviceId,
      'offerId':offerId
    };
  }


}