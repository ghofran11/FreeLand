import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/app/notifications/infrastructure/repo/notification_repository_impl.dart';
import 'package:freeland/app/notifications/presentation/state/notification_event.dart';
import 'package:freeland/app/notifications/presentation/state/notification_state.dart';
import 'package:freeland/core/bloc_status.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late final NotificationRepositoryImpl _notificationRepositoryImpl;
  List<NotificationDto> notification = [];
  List<NotificationDto> requests = [];
  bool isConnect=false;

  NotificationBloc(NotificationRepositoryImpl notificationRepositoryImpl)
      : super(NotificationState()) {
    _notificationRepositoryImpl = notificationRepositoryImpl;
    on<NotificationEvent>((event, emit) async {
      if (event is FetchAllNotification) {
        emit(state.copyWith(notificationStatus: BlocStatus.loading()));

        (await _notificationRepositoryImpl.fetchAllNotifications()).fold(
            (left) => emit(state.copyWith(
                notificationStatus: BlocStatus.fail(error: left))),
            (right) => {
                  emit(
                      state.copyWith(notificationStatus: BlocStatus.success())),
                      notification = right,
                });
      }

      if(event is  ResponseConnection){
        ( await _notificationRepositoryImpl.responseConnection(isConnect)).fold(
                (left) => emit(state.copyWith(responseStatus: BlocStatus.fail(error: left))),

                (right) => emit(state.copyWith(responseStatus:BlocStatus.success())));
      }

      if(event is FetchAllRequestById ){
        emit(state.copyWith(responseStatus: BlocStatus.loading()));

        (await _notificationRepositoryImpl.fetchAllRequest()).fold(
                (left) => emit(state.copyWith(
                AllrequestStatus: BlocStatus.fail(error: left))),
                (right) => {
              emit(
                  state.copyWith(AllrequestStatus: BlocStatus.success())),
              requests = right,
            });
      }
    });
  }
}
