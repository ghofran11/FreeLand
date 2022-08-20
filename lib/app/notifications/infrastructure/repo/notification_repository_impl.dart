 import 'package:either_dart/src/either.dart';
import 'package:freeland/app/notifications/domain/repos/notification_repository.dart';
import 'package:freeland/app/notifications/infrastructure/data_source/remote.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/app/notifications/infrastructure/models/send_response_params.dart';
import 'package:freeland/app/profile/infrastructur/models/sendConnectionParams.dart';
import 'package:freeland/common/network/error_handler.dart';

class NotificationRepositoryImpl extends NotificationRepository{
  NotificationRemote remote;
  NotificationRepositoryImpl({required this.remote});
  @override
  Future<Either<String, List<NotificationDto>>> fetchAllNotifications() {
    return throwAppException<List<NotificationDto>>(() async {
      final List<NotificationDto> notification = await remote.fetchAllNotifications();
      return (notification);
    });
  }

  @override
  Future<Either<String, void>> responseConnection({required SendResponseParam param}) {
    return throwAppException<void>(() async {
      await remote.connectedResponse(param: param);
    });
  }

  @override
  Future<Either<String, List<NotificationDto>>> fetchAllRequest() {
    return throwAppException<List<NotificationDto>>(() async {
      final List<NotificationDto> requests = await remote.fetchAllNotifications();
      return (requests);
    });
  }





 }