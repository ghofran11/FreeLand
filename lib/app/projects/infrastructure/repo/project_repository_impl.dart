import 'package:either_dart/src/either.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/projects/domain/entities/add_project_params.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/my_projects.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';
import 'package:freeland/app/projects/domain/repos/project_repository.dart';
import 'package:freeland/app/projects/infrastructure/data_source/remote/project_remote.dart';
import 'package:freeland/app/projects/infrastructure/models/comment.dart';
import 'package:freeland/app/projects/infrastructure/models/comment_offer.dart';
import 'package:freeland/app/projects/infrastructure/models/offer.dart';
import 'package:freeland/common/network/error_handler.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectRemote remote;

  ProjectRepositoryImpl({required this.remote});

  @override
  Future<Either<String, dynamic>> sendOffer({required OfferParams params}) {
    return throwAppException(() async {
      final OfferDto result = await remote.sendOffer(params: params);
    });
  }

  @override
  Future<Either<String, dynamic>> sendComment({required CommentParams params}) {
    return throwAppException(() async {
      final CommentDto result = await remote.sendComment(params: params);
    });
  }

  @override
  Future<Either<String, dynamic>> fetchAllComment({required String serviceId}) {
    return throwAppException<List<CommentOfferDto>>(() async {
      final List<CommentOfferDto> comments = await remote.fetchAllComment();
      return (comments);
    });
  }

  @override
  Future<Either<String, MyProjects>> fetchMyProjects() {
    return throwAppException<MyProjects>(() async {
      final List<ServiceDto> postedServices =
          await remote.fetchMyPostedServices();
      final List<ServiceDto> pendingServices =
          await remote.fetchMyPendingServices();
      final List<ServiceDto> workingOnServices =
          await remote.fetchMyWorkingOnServices();
      return (MyProjects(
          posted: postedServices,
          pending: pendingServices,
          working: workingOnServices));
    });
  }

  @override
  Future<Either<String, void>> addProject({required AddProjectParams params}) {
    return throwAppException<void>(() async {
      await remote.addProject(params: params);
    });
  }
}
