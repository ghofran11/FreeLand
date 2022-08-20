import 'package:freeland/app/notifications/infrastructure/models/send_response_params.dart';
import 'package:freeland/app/profile/infrastructur/models/sendConnectionParams.dart';

abstract class NotificationEvent{

}
class FetchAllNotification extends NotificationEvent{}
class FetchAllRequestById extends NotificationEvent{}

class ResponseConnection extends NotificationEvent{
  SendResponseParam param;
    ResponseConnection({required this.param});
}