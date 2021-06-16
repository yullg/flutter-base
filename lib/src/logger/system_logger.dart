class SystemLogger {
  static void log(dynamic message, [dynamic error, StackTrace? trace]) {
    try {
      print(_stringifyLog(message, error, trace));
    } catch (e) {}
  }

  static String _stringifyLog(dynamic message, [dynamic error, StackTrace? trace]) {
    StringBuffer result = StringBuffer();
    result.write("${message ?? '---'}    ");
    result.writeln("${error ?? '---'}");
    if (trace != null) {
      result.writeln(trace);
    }
    return result.toString();
  }

  SystemLogger._();
}
