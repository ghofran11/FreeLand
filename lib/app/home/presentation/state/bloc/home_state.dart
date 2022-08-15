part of 'home_bloc.dart';

class HomeState  {
  @override
  List<Object?> get props => [categoryStatus,serviceStatus];

   final BlocStatus categoryStatus;
   final BlocStatus serviceStatus;

  const HomeState({
    this.categoryStatus = const BlocStatus(),
    this.serviceStatus = const BlocStatus(),
  });

  HomeState copyWith(
      {BlocStatus? categoryStatus,
        BlocStatus? serviceStatus
      }) {
    return HomeState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      serviceStatus: serviceStatus?? this.serviceStatus
    );
  }

}
