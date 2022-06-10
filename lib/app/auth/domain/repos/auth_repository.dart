import 'package:dio_refresh_bot/dio_refresh_bot.dart';
import 'package:either_dart/either.dart';
import 'package:freeland/app/auth/domain/entities/login_params.dart';
import 'package:freeland/app/auth/domain/entities/sign_up_params.dart';
import 'package:freeland/core/user/entities/user.dart';

abstract class AuthRepository {
  AuthRepository();

  Future<Either<String, dynamic>> login({
    required LoginParams params,
  });

  Future<String?> signUp({
    required SignUpParams params,
  });

  Future<bool> logout();

  Stream<AuthStatus> get authStatusStream;

  Stream<User?> get userStream;

  Future<void> setUser(User value);

  User? getUser();

// Future<Either<String, bool>> resetPassword(
//     {required String email,
//     required String pinCode,
//     required String newPassword});
//
// Future<Either<String, bool>> forgetPassword({required String email});
// Future<Either<String, bool>> confirmResetPasswordCode(
//     {required String email, required String pinCode});
// Future<String?> verify({
//   required SignUpParams params,
// });
}
