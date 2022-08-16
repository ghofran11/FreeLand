part of 'home_bloc.dart';

class HomeState {
  @override
  List<Object?> get props =>
      [categoryStatus, serviceStatus, contactUsStatus, commonQuestionsStatus,userStatus];

   final BlocStatus categoryStatus;
   final BlocStatus serviceStatus;
   final BlocStatus userStatus;
  final BlocStatus contactUsStatus;
  final BlocStatus commonQuestionsStatus;

  const HomeState({
    this.categoryStatus = const BlocStatus(),
    this.serviceStatus = const BlocStatus(),
    this.contactUsStatus = const BlocStatus(),
    this.userStatus = const BlocStatus(),
    this.commonQuestionsStatus = const BlocStatus(),
  });

  HomeState copyWith(
      {BlocStatus? categoryStatus,
      BlocStatus? serviceStatus,
        BlocStatus? userStatus,
      BlocStatus? commonQuestionsStatus,
      BlocStatus? contactUsStatus}) {
    return HomeState(
        userStatus: userStatus ?? this.userStatus
        categoryStatus: categoryStatus ?? this.categoryStatus,
        contactUsStatus: contactUsStatus ?? this.contactUsStatus,
        commonQuestionsStatus:
            commonQuestionsStatus ?? this.commonQuestionsStatus,
        serviceStatus: serviceStatus ?? this.serviceStatus);
  }

   @override
   String toString() {
     return "FetchAllCategory: $categoryStatus,FetchAllService: $serviceStatus,FetchAllUser:$userStatus ";
   }

}
