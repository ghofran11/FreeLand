part of 'home_bloc.dart';

class HomeState {
  @override
  List<Object?> get props =>
      [categoryStatus, serviceStatus, contactUsStatus, commonQuestionsStatus];

  final BlocStatus categoryStatus;
  final BlocStatus serviceStatus;
  final BlocStatus contactUsStatus;
  final BlocStatus commonQuestionsStatus;

  const HomeState({
    this.categoryStatus = const BlocStatus(),
    this.serviceStatus = const BlocStatus(),
    this.contactUsStatus = const BlocStatus(),
    this.commonQuestionsStatus = const BlocStatus(),
  });

  HomeState copyWith(
      {BlocStatus? categoryStatus,
      BlocStatus? serviceStatus,
      BlocStatus? commonQuestionsStatus,
      BlocStatus? contactUsStatus}) {
    return HomeState(
        categoryStatus: categoryStatus ?? this.categoryStatus,
        contactUsStatus: contactUsStatus ?? this.contactUsStatus,
        commonQuestionsStatus:
            commonQuestionsStatus ?? this.commonQuestionsStatus,
        serviceStatus: serviceStatus ?? this.serviceStatus);
  }
}
