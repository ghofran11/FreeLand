import 'package:dio/dio.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/network/error_handler.dart';

class NotificationRemote{
  final Dio _dio;

  NotificationRemote(Dio dio) : _dio = dio;


  Future<List<NotificationDto>> fetchAllNotifications() async {
    return throwDioException<List<NotificationDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.notificationFetch);
      var notification = NotificationFromJson(response.data);
      return notification;
    });
  }

  Future<List<NotificationDto>> fetchAllRequest() async {
    return throwDioException<List<NotificationDto>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.fetchAllRequest);
      var requests = NotificationFromJson(response.data);
      return requests;
    });
  }

  Future<void> connectedRequest(bool isConnect) async {
    return throwDioException<void>(() async {
       await _dio.post(AppUri.connectRequest,data: isConnect);
    });


  }
}