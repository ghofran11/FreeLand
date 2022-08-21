import 'package:either_dart/either.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/commom_question.dart';
import 'package:freeland/app/home/infrastructure/models/contact_us_params.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/app/projects/infrastructure/models/deatail_service_dto.dart';

abstract class HomeRepository {
  Future<Either<String, List<CategoryDto2>>> fetchAllCategory();

  Future<Either<String, List<ServiceDto>>> fetchAllServices(String categoryId);

  Future<Either<String, List<CommonQuestionModel>>> fetchAllCommonQuestions();

  Future<Either<String, void>> contactUs(ContactUSModel contactUs);
  Future<Either<String, List<UserDto>>> fetchAllUsers();

 // Future<Either<String, List<DeatailServiceDto>>> fetchAllServicesDetail(String categoryId);

}
