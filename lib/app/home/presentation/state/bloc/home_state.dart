part of 'home_bloc.dart';

class HomeState  {


   final BlocStatus categoryStatus;
   final BlocStatus serviceStatus;
   final BlocStatus userStatus;

  const HomeState({
    this.categoryStatus = const BlocStatus(),
    this.serviceStatus = const BlocStatus(),
    this.userStatus = const BlocStatus(),
  });

  HomeState copyWith(
      {BlocStatus? categoryStatus,
        BlocStatus? serviceStatus,
        BlocStatus? userStatus,
      }) {
    return HomeState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      serviceStatus: serviceStatus?? this.serviceStatus,
      userStatus: userStatus ?? this.userStatus
    );
  }

   @override
   String toString() {
     return "FetchAllCategory: $categoryStatus,FetchAllService: $serviceStatus,FetchAllUser:$userStatus ";
   }

}
