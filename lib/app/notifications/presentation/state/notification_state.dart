import 'package:freeland/core/bloc_status.dart';

class NotificationState {
  final BlocStatus notificationStatus;

  NotificationState({
    this.notificationStatus = const BlocStatus(),
  });

  NotificationState copyWith({BlocStatus? notificationStatus}) {
    return NotificationState(
        notificationStatus: notificationStatus ?? this.notificationStatus);
  }
  @override
  String toString() {
    return "offerSubmission: $notificationStatus ";
  }
}
