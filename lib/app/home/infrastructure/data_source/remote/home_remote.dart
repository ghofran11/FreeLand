import 'package:dio/dio.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/commom_question.dart';
import 'package:freeland/app/home/infrastructure/models/contact_us_params.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';

class HomeRemote {
  final Dio _dio;

  HomeRemote(Dio dio) : _dio = dio;

  Future<List<CategoryDto>> fetchAllCategory() async {
    return throwDioException<List<CategoryDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.categoryFetched);
      var categories = categoriesFromJson(response.data);
      return categories;
    });
  }

  Future<List<CommonQuestionModel>> fetchAllCommonQuestions() async {
    return throwDioException<List<CommonQuestionModel>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.commonQuestionFetched);
      var commonQuestions = commonQuestionsFromJson(response.data);
      return commonQuestions;
    });
  }

  Future<List<ServiceDto>> fetchAllService(String categoryId) async {
    return throwDioException<List<ServiceDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.serviceFetched,
          queryParameters: {'categoryId': categoryId});
      // var services = serviceFromJson(response.data);
      var services = [
        ServiceDto(
            id: "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            name: "name",
            ownerId: "ownerId",
            nameOwner: "nameOwner",
            description: "description",
            evalution: 5,
            serviceType: 1,
            minPrice: 20,
            maxPrice: 200)
      ];
      return services;
    });
  }

  Future<List<UserDto>> fetchAllUser() async {
    return throwDioException<List<UserDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.userFetched);
      var users = userFromJson(response.data);
      return users;
    });
  }

  Future<void> contactUs(ContactUSModel contactUs) async {
    return throwDioException<void>(() async {
      await _dio.post(AppUri.contactUsCreate, data: await contactUs.formData());
    });
  }
}
