import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freeland/core/bloc_status.dart';

class NotificationState {
  final BlocStatus notificationStatus;
  final BlocStatus responseStatus;
  final BlocStatus allRequestStatus;

  NotificationState({
    this.notificationStatus = const BlocStatus(),
    this.responseStatus=const BlocStatus(),
    this.allRequestStatus=const BlocStatus()
  });

  NotificationState copyWith({BlocStatus? notificationStatus,BlocStatus? responseStatus,BlocStatus? AllrequestStatus}) {
    return NotificationState(
        notificationStatus: notificationStatus ?? this.notificationStatus,
        responseStatus: responseStatus ?? this.responseStatus,
      allRequestStatus: AllrequestStatus ?? allRequestStatus
    );
  }
  @override
  String toString() {
    return "notificationSubmission: $notificationStatus, responseStatus:$responseStatus,allRequest: $allRequestStatus ";
  }
}
