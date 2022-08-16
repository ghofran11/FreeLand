import 'package:either_dart/either.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/commom_question.dart';
import 'package:freeland/app/home/infrastructure/models/contact_us_params.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';

abstract class HomeRepository {
  Future<Either<String, List<CategoryDto>>> fetchAllCategory();

  Future<Either<String, List<ServiceDto>>> fetchAllServices(String categoryId);

  Future<Either<String, List<CommonQuestionModel>>> fetchAllCommonQuestions();

  Future<Either<String, void>> contactUs(ContactUSModel contactUs);
}
