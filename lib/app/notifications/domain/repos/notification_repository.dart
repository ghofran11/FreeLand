import 'package:either_dart/either.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';

abstract class NotificationRepository{
  NotificationRepository();

  Future<Either<String, List<NotificationDto>>> fetchAllNotifications();
  //toDo:the type of allrequest
  Future<Either<String, List<NotificationDto>>> fetchAllRequest();

  Future<Either<String, void>> connectRequest(bool isConnect);


}