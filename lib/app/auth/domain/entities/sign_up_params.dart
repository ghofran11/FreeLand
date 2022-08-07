import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freeland/app/info/country/infrastrcture/model/country.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/injection/injection.dart';

class SignUpParams extends Equatable {
  final String fullName;
  final String userName;
  final String password;
  final String email;
  final String phoneNumber;
  final String countryId;
  final String address;
  final String? cityId;
  final String? deviceToken;
  final int userType;
  final String bDay;


  @override
  List<Object> get props => [
        fullName,
        password,
      ];

  const SignUpParams(
      {required this.fullName,
      required this.password,
      required this.address,
      required this.countryId,
      required this.email,
      required this.phoneNumber,
      this.cityId,
      this.deviceToken,
      this.userType = 1,
      required this.bDay,
      required this.userName});

  Future<Map<String, dynamic>> toJson() async {
    String token = await getIt<FirebaseNotificationService>().getToken() ?? " ";
    return {
      'FullName': fullName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Password': password,
      'Address': address,
      'CityId': cityId,
      'CountryId': countryId,
      'deviceToken': token,
      'UserType': userType,
      'BDay': bDay,
    };
  }

  SignUpParams copyWith({
    String? fullName,
    String? userName,
    String? accountVerification,
    String? email,
    String? phoneNumber,
    String? password,
    String? address,
    String? deviceToken,
    String? verificationCode,
    String? cityId,
    String? countryId,
    int? userType,
    String? bDay,
    String? file,
  }) {
    return SignUpParams(
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      address: address ?? this.address,
      deviceToken: deviceToken ?? this.deviceToken,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
      userType: userType ?? this.userType,
      bDay: bDay ?? this.bDay,
    );
  }
}
