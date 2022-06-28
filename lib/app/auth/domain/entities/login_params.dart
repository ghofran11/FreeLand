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
      'password': password,
      'userName': email,
      "rememberMe": true,
      'deviceToken': deviceToken,
    };
  }
}
