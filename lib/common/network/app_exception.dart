class AppException implements Exception {
  final String message;

  final Exception innerException;

  AppException(this.message, this.innerException);

  ///ToDo
  factory AppException.unknown() => AppException("Some Thing Went Wrong", Exception());

  factory AppException.known(message) => AppException(message, Exception());

  @override
  String toString() => "message : $message, innerException: $innerException";
}
