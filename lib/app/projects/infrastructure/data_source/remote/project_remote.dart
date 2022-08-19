import 'package:dio/dio.dart';
import 'package:freeland/app/projects/domain/entities/add_project_params.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';
import 'package:freeland/app/projects/infrastructure/models/comment.dart';
import 'package:freeland/app/projects/infrastructure/models/comment_offer.dart';
import 'package:freeland/app/projects/infrastructure/models/offer.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';

class ProjectRemote{
  final Dio _dio;
  ProjectRemote(  Dio dio):_dio=dio;

  Future<OfferDto> sendOffer({
  required OfferParams params,
})
  async{
    return throwDioException(() async {
      print(params.toJson());
      final response =
      await _dio.post(AppUri.sendOffer, data: await params.toJson());
      return OfferDto.fromMap(response.data);
    });
  }

  Future<CommentDto> sendComment({
    required CommentParams params,
  })
  async{
    return throwDioException(() async {
      final response =
      await _dio.post(AppUri.sendComment, data: await params.toJson());
      return CommentDto.fromMap(response.data);
    });
  }


  Future<List<CommentOfferDto>> fetchAllComment() async {
    return throwDioException<List<CommentOfferDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.commentOfferFetch);
      var comments = commentsFromJson(response.data);
      return comments;
    });
  }

  Future<void> addProject({
    required AddProjectParams params,
  })
  async{
    return throwDioException(() async {
      await _dio.post(AppUri.addProject, data: await params.formData());
    });
  }
}