class AbortException implements Exception {
  final dynamic message;

  AbortException([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return "AbortException";
    return "AbortException: $message";
  }
}
