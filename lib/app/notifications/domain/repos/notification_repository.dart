import 'package:either_dart/either.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';

abstract class NotificationRepository{
  NotificationRepository();

  Future<Either<String, List<NotificationDto>>> fetchAllNotifications();


}