import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/common/network/app_exception.dart';
import 'package:freeland/common/network/error_handler.dart';

import '../../../../../injection/injection.dart';
import '../data_source/remote/country_remote.dart';

class CountryRepo {
  CountryRemote remote = CountryRemote(getIt<Dio>());

  CountryRepo(this.remote);

  Future<Either<String, List<CountryDto>>> fetchAllCountry() async {
    return throwAppException<List<CountryDto>>(() async {
      final List<CountryDto> countries = await remote.fetchAllCountry();
      return countries;
    });
  }
}
