import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';

class ProfileRemote {
  final Dio _dio;

  ProfileRemote(this._dio);

  getMyProfile() async {
    final response = await _dio.get(AppUri.getMyProfile);
    return MyProfile.fromJson({
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "fullName": "string",
      "bio": "string",
      "numOfCompletedProjects": 0,
      "numOfConnections": 0,
      "evalution": 0,
      "careerDtos": [
        {"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6", "name": "string"}
      ],
      "educationDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "startDate": "2022-08-16T19:37:57.384Z",
          "graduationDate": "2022-08-16T19:37:57.384Z",
          "name": "string"
        }
      ],
      "serviceDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "FlowerLab",
          "ownerId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "nameOwner": "Woroud",
          "description": "Good Description",
          "evalution": 0,
          "serviceType": 1,
          "minPrice": 0,
          "maxPrice": 200
        }
      ],
      "workDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "string",
          "description": "string",
          "link": "http://karo1234-001-site1.atempurl.com/swagger/index.html",
          "createdDate": "2022-08-16T19:37:57.384Z"
        }
      ],
      "connectedUsers": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "string",
          "imagePath": "string"
        }
      ]
    });
    return MyProfile.fromJson(response.data);
  }

  Future<void> sendConnect() async {
    return throwDioException<void>(() async {
      await _dio.post(AppUri.contactUsCreate);
    });
  }

  getAnotherProfile(String id) async {
    // final response =
    //     await _dio.get(AppUri.getPortfolioById, queryParameters: {'id': id});
    await Future.delayed(Duration(seconds: 2));

    return MyProfile.fromJson({
      "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
      "fullName": "string",
      "bio": "string",
      "numOfCompletedProjects": 0,
      "numOfConnections": 0,
      "evalution": 0,
      "careerDtos": [
        {"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6", "name": "string"}
      ],
      "educationDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "startDate": "2022-08-16T19:37:57.384Z",
          "graduationDate": "2022-08-16T19:37:57.384Z",
          "name": "string"
        }
      ],
      "serviceDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "FlowerLab",
          "ownerId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "nameOwner": "Woroud",
          "description": "Good Description",
          "evalution": 0,
          "serviceType": 1,
          "minPrice": 0,
          "maxPrice": 200
        }
      ],
      "workDtos": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "string",
          "description": "string",
          "link": "http://karo1234-001-site1.atempurl.com/swagger/index.html",
          "createdDate": "2022-08-16T19:37:57.384Z"
        }
      ],
      "connectedUsers": [
        {
          "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
          "name": "string",
          "imagePath": "string"
        }
      ]
    });
    // return MyProfile.fromJson(response.data);
  }
}
