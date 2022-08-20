import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/core/bloc_status.dart';

class NotificationState {
  final BlocStatus notificationStatus;
  final BlocStatus requestStatus;
  final BlocStatus allRequestStatus;

  NotificationState({
    this.notificationStatus = const BlocStatus(),
    this.requestStatus=const BlocStatus(),
    this.allRequestStatus=const BlocStatus()
  });

  NotificationState copyWith({BlocStatus? notificationStatus,BlocStatus? requestStatus,BlocStatus? AllrequestStatus}) {
    return NotificationState(
        notificationStatus: notificationStatus ?? this.notificationStatus,
      requestStatus: requestStatus ?? this.requestStatus,
      allRequestStatus: AllrequestStatus ?? this.allRequestStatus
    );
  }
  @override
  String toString() {
    return "notificationSubmission: $notificationStatus, connectRequest:$requestStatus,allRequest: $allRequestStatus ";
  }
}
