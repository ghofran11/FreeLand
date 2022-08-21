import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freeland/common/constant/src/url.dart';
import 'package:freeland/common/platform_services/firebase/notification_firebase.dart';
import 'package:freeland/common/utils/storage_service.dart';

const _deviceTokenKey = '__device_token__';

class RefreshDeviceTokenService {
  final Dio _dio;
  final StorageService _storageService;
  final FirebaseNotificationService _firebaseNotificationService;
  StreamSubscription<String?>? onTokenRefresh;
  // Timer? _timer;

  RefreshDeviceTokenService({
    required Dio dio,
    required StorageService storageService,
    required FirebaseNotificationService firebaseNotificationService,
  })  : _dio = dio,
        _storageService = storageService,
        _firebaseNotificationService = firebaseNotificationService;

  void start() {
    onTokenRefresh ??=
        _firebaseNotificationService.onTokenRefresh.listen((token) {
      _refreshDeviceToken(token: token);
    });
    // if (shouldRefreshToken) {
    //   _startTimer();
    // }
  }

  void stop() {
    onTokenRefresh?.cancel();
    // _stopTimer();
  }

  bool get shouldRefreshToken =>
      _storageService.getString(_deviceTokenKey) != null;

  String? get storedDeviceToken => _storageService.getString(_deviceTokenKey);

  Future<void> _refreshDeviceToken({
    required String token,
  }) async {
    try {
      await _dio.post(
        AppUri.refreshDeviceToken,
        queryParameters: {
          'deviceToken': token,
        },
      );
      // _stopTimer();
      await _deleteCache(_deviceTokenKey);
    } catch (e) {
      await _cacheToken(token);
      // _startTimer();
    }
  }

  // void _stopTimer() {
  //   _timer?.cancel();
  //   _timer = null;
  // }

  Future<void> _cacheToken(String token) {
    return _storageService.setString(_deviceTokenKey, token);
  }

  Future<void> _deleteCache(String token) {
    return _storageService.remove(_deviceTokenKey);
  }
  //
  // void _startTimer() {
  //   _timer ??= Timer.periodic(
  //     const Duration(seconds: 60),
  //     (timer) async {
  //       if (await InternetConnectionChecker().hasConnection) {
  //         _refreshDeviceToken(token: storedDeviceToken!);
  //       }
  //     },
  //   );
  // }
}
