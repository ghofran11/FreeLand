import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/common/helpers/app_bloc_observer.dart';

Future<Widget?> bootstrap(FutureOr<Widget> Function() builder) async {
  return BlocOverrides.runZoned(
    () async {
      await EasyLocalization.ensureInitialized();
      return null;
    },
    blocObserver: AppBlocObserver(),
  );
}
