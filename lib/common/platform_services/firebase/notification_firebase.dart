import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freeland/common/platform_services/firebase/local_notifications_service.dart';
//ToDo: check capital letter

const allTopics = ["All"];

abstract class FirebaseNotificationService {
  Future<void> setUpFirebase();

  Future<String?> getToken();

  Future<void> subscribeToTopic({required String topic});

  Future<void> subscribeToTopics({List<String> topics = const []});

  Future<void> unsubscribeFromTopics({List<String> topics = const []});

  Stream<String> get onTokenRefresh;
}

class FirebaseNotificationServiceImpl extends FirebaseNotificationService {
  FirebaseNotificationServiceImpl();

  final instance = FirebaseMessaging.instance;

  @override
  Stream<String> get onTokenRefresh => instance.onTokenRefresh;

  @override
  Future<void> setUpFirebase() async {
    await LocalNotificationService.initialize();
    await subscribeToTopic(topic: 'all');
    await instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    if (Platform.isIOS) {
      await instance.requestPermission();
    }
    FirebaseMessaging.onMessage.listen((event) => onMessage(event));
  }

  Future<dynamic> onMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      final body = notification.body;
      final title = notification.title;
      if (body != null && title != null) {
        LocalNotificationService.display(message);
      }
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      return instance.getToken();
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> subscribeToTopic({required String topic}) async {
    await instance.subscribeToTopic(topic);
  }

  @override
  Future<void> subscribeToTopics({List<String> topics = const []}) async {
    for (var topic in topics) {
      await instance.subscribeToTopic(topic);
    }
  }

  @override
  Future<void> unsubscribeFromTopics({List<String> topics = const []}) async {
    for (var topic in topics) {
      await instance.unsubscribeFromTopic(topic);
    }
  }
}
