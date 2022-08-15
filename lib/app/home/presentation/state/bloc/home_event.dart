part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchAllCategory extends HomeEvent {}
class FetchAllService extends HomeEvent {
  final String id;
  FetchAllService({required this. id});
}
