import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String password;
  final String phoneNumber;
  final String? deviceToken;

  @override
  List<Object?> get props => [password, deviceToken, phoneNumber];

  const LoginParams.skip({this.deviceToken})
      : password = '',
        phoneNumber = '';

  const LoginParams({
    required this.password,
    required this.phoneNumber,
    this.deviceToken,
  });

  @override
  String toString() {
    return 'LoginParams{'
        ' password: $password,'
        ' accountVerification: $phoneNumber,'
        ' deviceToken: $deviceToken,';
  }

  LoginParams copyWith({
    String? password,
    String? phoneNumber,
    String? deviceToken,
  }) {
    return LoginParams(
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      deviceToken: deviceToken ?? this.deviceToken,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'phoneNumber': phoneNumber,
      "rememberMe": true,
      'deviceToken': deviceToken,
    };
  }
}
