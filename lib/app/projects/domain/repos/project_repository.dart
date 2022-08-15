import 'package:either_dart/either.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';

abstract class ProjectRepository{

  Future<Either<String, dynamic>> sendOffer({
    required OfferParams params,
  });
  Future<Either<String, dynamic>> sendComment({
    required CommentParams params,
  });

  Future<Either<String, dynamic>> fetchAllComment({
    required String serviceId,
  });
}