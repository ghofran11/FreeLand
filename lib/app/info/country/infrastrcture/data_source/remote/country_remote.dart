import 'package:dio/dio.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';
import 'package:freeland/injection/injection.dart';

class CountryRemote {
  final Dio _dio;

  CountryRemote(this._dio);

  Future<List<CountryDto>> fetchAllCountry() async {
    return throwDioException<List<CountryDto>>(() async {
      Response response;
      response = await _dio.get(AppUri.countryFetched);
      var countries = countriesFromJson(response.data);
      return countries;
    });
  }
}
