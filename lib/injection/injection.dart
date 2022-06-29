import 'package:flutter/cupertino.dart';
import 'package:freeland/injection/src/auth_injection.dart';
import 'package:freeland/injection/src/general_injection.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future initInjection(BuildContext context) async {
  await generalInject(context);
  await authInject();

}
