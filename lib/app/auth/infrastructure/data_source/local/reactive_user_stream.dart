import 'dart:async';

import 'package:freeland/core/t_storage.dart';
import 'package:freeland/core/user/entities/user.dart';

import 'auth_local.dart';

class ReactiveUser extends TStorage<User> with TStorageStreamMixin {
  final AuthLocal local;

  ReactiveUser(this.local);

  @override
  FutureOr<void> delete() {
    super.delete();
    local.removeUser();
  }

  @override
  FutureOr<void> write(User? value) async {
    super.write(value);
    if (value == null) {
      delete();
      return;
    }
    await local.setUser(value);
  }

  @override
  User? read() {
    return local.getUser();
  }
}
