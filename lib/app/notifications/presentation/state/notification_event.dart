abstract class NotificationEvent{

}
class FetchAllNotification extends NotificationEvent{}
class FetchAllRequestById extends NotificationEvent{}
class ConnectRequest extends NotificationEvent{
  bool isConnect;
  ConnectRequest({required this.isConnect});
}