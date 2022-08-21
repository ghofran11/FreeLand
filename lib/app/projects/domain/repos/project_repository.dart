import 'package:either_dart/either.dart';
import 'package:freeland/app/contract/contract_add_param.dart';
import 'package:freeland/app/projects/domain/entities/add_project_params.dart';
import 'package:freeland/app/projects/domain/entities/comment_params.dart';
import 'package:freeland/app/projects/domain/entities/my_projects.dart';
import 'package:freeland/app/projects/domain/entities/offer_params.dart';

abstract class ProjectRepository {
  Future<Either<String, dynamic>> sendOffer({
    required OfferParams params,
  });
  Future<Either<String, dynamic>> sendComment({
    required CommentParams params,
  });

  Future<Either<String, dynamic>> fetchAllComment({
    required String serviceId,
  });

  Future<Either<String, dynamic>> addProject({
    required AddProjectParams params,
  });

  Future<Either<String, MyProjects>> fetchMyProjects();

  Future<Either<String, void>> addContract(AddContractParam param);
}
