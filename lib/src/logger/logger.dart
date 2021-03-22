import 'logger_transit.dart';

class Logger {
  final String _name;

  Logger(this._name);

  void trace(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.trace, DateTime.now(), message, error, trace);
  }

  void debug(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.debug, DateTime.now(), message, error, trace);
  }

  void info(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.info, DateTime.now(), message, error, trace);
  }

  void warn(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.warn, DateTime.now(), message, error, trace);
  }

  void error(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.error, DateTime.now(), message, error, trace);
  }

  void fatal(dynamic message, [dynamic? error, StackTrace? trace]) {
    _log(Level.fatal, DateTime.now(), message, error, trace);
  }

  void _log(Level level, DateTime time, dynamic message, [dynamic? error, StackTrace? trace]) {
    try {
      LoggerTransit.instance.log(LogEvent(_name, level, time, message, error, trace));
    } catch (e) {}
  }
}
