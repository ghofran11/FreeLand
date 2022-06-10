import 'package:equatable/equatable.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/injection/injection.dart';

class SignUpParams extends Equatable {
  final String fullName;

  ///email or phoneNumber
  final String accountVerification;
  final String password;
  final String countryId;
  final String? cityId;
  final String? deviceToken;
  final String? verificationCode;

  @override
  List<Object> get props => [
        fullName,
        accountVerification,
        password,
      ];

  const SignUpParams({
    required this.fullName,
    required this.accountVerification,
    required this.password,
    required this.countryId,
    this.cityId,
    this.deviceToken,
    this.verificationCode,
  });

  Future<Map<String, dynamic>> toJson() async {
    String token = await getIt<FirebaseNotificationService>().getToken() ?? " ";
    if (verificationCode != null) {
      return {
        'fullName': fullName,
        'accountVerification': accountVerification,
        'verificationCode': verificationCode,
        'password': password,
        'cityId': cityId,
        'countryId': countryId,
        'deviceToken': token,
      };
    } else {
      return {
        'fullName': fullName,
        'accountVerification': accountVerification,
        'password': password,
        'cityId': cityId,
        'countryId': countryId,
        'deviceToken': token,
      };
    }
  }

  SignUpParams copyWith({
    String? fullName,
    String? accountVerification,
    String? password,
    String? deviceToken,
    String? verificationCode,
    String? cityId,
    String? countryId,
  }) {
    return SignUpParams(
      verificationCode: verificationCode ?? this.verificationCode,
      fullName: fullName ?? this.fullName,
      accountVerification: accountVerification ?? this.accountVerification,
      password: password ?? this.password,
      deviceToken: deviceToken ?? this.deviceToken,
      countryId: countryId ?? this.countryId,
      cityId: cityId ?? this.cityId,
    );
  }
}
