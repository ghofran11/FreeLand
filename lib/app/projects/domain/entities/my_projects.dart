import 'package:freeland/app/home/infrastructure/models/service.dart';

class MyProjects {
  final List<ServiceDto> posted;
  final List<ServiceDto> pending;
  final List<ServiceDto> working;

  MyProjects({
    this.posted = const [],
    this.pending = const [],
    this.working = const [],
  });
}
