import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String password;
  final String email;
  final String? deviceToken;

  @override
  List<Object?> get props => [password, deviceToken, email];

  const LoginParams.skip({this.deviceToken})
      : password = '',
        email = '';

  const LoginParams({
    required this.password,
    required this.email,
    this.deviceToken,
  });

  @override
  String toString() {
    return 'LoginParams{'
        ' password: $password,'
        ' accountVerification: $email,'
        ' deviceToken: $deviceToken,';
  }

  LoginParams copyWith({
    String? password,
    String? email,
    String? deviceToken,
  }) {
    return LoginParams(
      password: password ?? this.password,
      email: email ?? this.email,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Password': password,
      'UserName': email,
      "RememberMe": true,
      'deviceToken': deviceToken,
    };
  }

  FormData toFormData(Map<String, dynamic> json) {
    return FormData.fromMap( {
      'Password': password,
      'UserName': email,
      "RememberMe": true,
    });
  }
}
