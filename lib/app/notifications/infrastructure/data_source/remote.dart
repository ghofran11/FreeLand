import 'package:dio/dio.dart';
import 'package:freeland/app/notifications/infrastructure/models/all_request.dart';
import 'package:freeland/app/notifications/infrastructure/models/notification.dart';
import 'package:freeland/app/notifications/infrastructure/models/send_response_params.dart';
import 'package:freeland/app/profile/infrastructur/models/sendConnectionParams.dart';
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

  Future<List<AllRequest>> fetchAllRequest() async {
    return throwDioException<List<AllRequest>>(() async {
      late final Response response;
      response = await _dio.get(AppUri.fetchAllRequest);
      var requests = RequestFromJson(response.data);
      return requests;
    });
  }

  Future<void> connectedResponse({required SendResponseParam param}) async {
    return throwDioException<void>(() async {
       await _dio.post(AppUri.connectResponse,data: param.toJson());
    });
  }
}