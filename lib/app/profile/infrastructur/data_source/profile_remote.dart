import 'package:dio/dio.dart';
import 'package:freeland/app/profile/infrastructur/models/my_profile.dart';

class ProfileRemote {
  final Dio _dio;

  ProfileRemote(this._dio);
  getMyProfile() async {
    final response = await _dio.get('Portfolio/App/GetPortfolioById');
    return MyProfile.fromJson(response.data);
  }
}
