import 'package:either_dart/either.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/app/notifications/infrastructure/models/send_response_params.dart';

abstract class NotificationRepository{
  NotificationRepository();

  Future<Either<String, List<NotificationDto>>> fetchAllNotifications();
  //toDo:the type of allrequest
  Future<Either<String, List<NotificationDto>>> fetchAllRequest();

  Future<Either<String, void>> responseConnection({required SendResponseParam param});


}