part of 'app_manager_bloc.dart';

class AppManagerState extends Equatable {
  const AppManagerState(
      {required this.status,
      this.message,
      this.expired = false,
      this.checkedUpdate = false,
      this.firstOpen = true,
      this.isSupported = false});

  final Status status;
  final String? message;
  final bool expired;
  final bool isSupported;
  final bool checkedUpdate;
  final bool firstOpen;

  @override
  List<Object?> get props =>
      [status, message, expired, checkedUpdate, isSupported, firstOpen];

  copyWith(
      {Status? status,
      String? message,
      bool? checkedUpdate,
      bool? expired,
      bool? firstOpen,
      bool? isSupported}) {
    return AppManagerState(
      isSupported: isSupported ?? this.isSupported,
      expired: expired ?? this.expired,
      firstOpen: firstOpen ?? this.firstOpen,
      checkedUpdate: checkedUpdate ?? this.checkedUpdate,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return status.name + "  ${message ?? ""}";
  }
}
