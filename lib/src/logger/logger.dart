import 'logger_conveyer.dart';

class Logger {
  final String _module;
  final String _name;

  const Logger(this._module, this._name);

  void trace(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.trace, DateTime.now(), message, error, trace);
  }

  void debug(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.debug, DateTime.now(), message, error, trace);
  }

  void info(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.info, DateTime.now(), message, error, trace);
  }

  void warn(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.warn, DateTime.now(), message, error, trace);
  }

  void error(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.error, DateTime.now(), message, error, trace);
  }

  void fatal(dynamic message, [dynamic error, StackTrace? trace]) {
    _log(LogLevel.fatal, DateTime.now(), message, error, trace);
  }

  void _log(LogLevel level, DateTime time, dynamic message, [dynamic error, StackTrace? trace]) {
    LogConveyer.convey(Log(_module, _name, level, time, message, error, trace)).catchError((e) {
      // ignore
    });
  }
}
