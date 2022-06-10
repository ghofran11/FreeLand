part of 'home_bloc.dart';

class HomeState extends Equatable {
  final Result resultAds;
  const HomeState({this.resultAds = const Result.init()});
  copyWith({Result? resultAds}) =>
      HomeState(resultAds: resultAds ?? this.resultAds);
  @override
  List get props => [resultAds];
}
