import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freeland/app/auth/domain/repos/auth_repository.dart';
import 'package:freeland/injection/injection.dart';

import '../entities/user.dart';

///This provider use for read role and user from storage
class UserProvider extends ChangeNotifier {
  UserProvider() {
    _user = getIt<AuthRepository>().getUser();
    _userStream = getIt<AuthRepository>().userStream.listen((event) {
      _user = event;
      notifyListeners();
    });
  }
  late User? _user;
  late final StreamSubscription<User?> _userStream;

  User? get user => _user;

  @override
  void dispose() {
    _userStream.cancel();
    super.dispose();
  }
}
