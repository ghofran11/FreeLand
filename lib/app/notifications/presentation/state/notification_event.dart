abstract class NotificationEvent{

}
class FetchAllNotification extends NotificationEvent{}
class FetchAllRequestById extends NotificationEvent{}

class ResponseConnection extends NotificationEvent{
  bool isConnect;
    ResponseConnection({required this.isConnect});
}