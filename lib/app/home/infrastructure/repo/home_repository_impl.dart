import 'package:either_dart/src/either.dart';
import 'package:freeland/app/home/domain/repos/home_repository.dart';
import 'package:freeland/app/home/infrastructure/data_source/remote/home_remote.dart';
import 'package:freeland/app/home/infrastructure/models/category.dart';
import 'package:freeland/app/home/infrastructure/models/service.dart';
import 'package:freeland/app/home/infrastructure/models/user.dart';
import 'package:freeland/common/network/error_handler.dart';
import 'package:freeland/core/user/entities/user.dart';

class HomeRepositoryImpl extends HomeRepository{
  HomeRemote remote;
  HomeRepositoryImpl({
    required this.remote
});


  @override
  Future<Either<String, List<CategoryDto>>> fetchAllCategory() {
    return throwAppException<List<CategoryDto>>(() async {
      final List<CategoryDto> categories = await remote.fetchAllCategory();
      return (categories);
    });
  }

  @override
  Future<Either<String, List<ServiceDto>>> fetchAllServices(String categoryId) {
    return throwAppException<List<ServiceDto>>(() async {
      final List<ServiceDto> services = await remote.fetchAllService(categoryId);
      return (services);
    });
  }

  @override
  Future<Either<String, List<UserDto>>> fetchAllUsers() {
    return throwAppException<List<UserDto>>(() async {
      final List<UserDto> user = await remote.fetchAllUser();
      return (user);
    });
  }}
