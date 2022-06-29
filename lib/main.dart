import 'package:flutter/material.dart';
import 'package:freeland/app/app.dart';
import 'package:freeland/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const MyApp());
}
