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

  Future<Either<String, dynamic>> signUp({
    required SignUpParams params,
  });

  Future<bool> logout();

  Stream<AuthStatus> get authStatusStream;

  Stream<User?> get userStream;

  Future<void> setUser(User value);

  User? getUser();


}
