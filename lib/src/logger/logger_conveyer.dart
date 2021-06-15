import 'dart:async';

import '../app/config_manager.dart';
import '../helper/enum_helper.dart';
import 'logger_appender.dart';

class LogConveyer {
  static final StreamController<LogEvent> _streamController = StreamController.broadcast();
  static StreamSubscription<LogEvent> _defaultStreamSubscription =
      _streamController.stream.listen(DefaultLoggerAppender().output, onError: (e) {});
  static StreamSubscription<LogEvent>? _consoleStreamSubscription;
  static StreamSubscription<LogEvent>? _fileStreamSubscription;

  static Future<void> initialize() async {
    if (Config.logger_consoleEnabled ?? false) {
      _consoleStreamSubscription = _streamController.stream.listen(
          ConsoleLoggerAppender(EnumHelper.parseString(Level.values, Config.logger_consoleLevel) ?? Level.info)
              .output,
          onError: (e) {});
    }
    if (Config.logger_fileEnabled ?? false) {
      _fileStreamSubscription = _streamController.stream.listen(
          FileLoggerAppender(EnumHelper.parseString(Level.values, Config.logger_fileLevel) ?? Level.info).output,
          onError: (e) {});
    }
    _defaultStreamSubscription.cancel();
  }

  static void convey(LogEvent logEvent) {
    _streamController.add(logEvent);
  }

  static Future<void> destroy() async {
    _defaultStreamSubscription = _streamController.stream.listen(DefaultLoggerAppender().output, onError: (e) {});
    _consoleStreamSubscription?.cancel();
    _consoleStreamSubscription = null;
    _fileStreamSubscription?.cancel();
    _fileStreamSubscription = null;
  }
}

enum Level { trace, debug, info, warn, error, fatal }

class LogEvent {
  final String loggerName;
  final Level level;
  final DateTime time;
  final dynamic message;
  final dynamic error;
  final StackTrace? trace;

  LogEvent(this.loggerName, this.level, this.time, this.message, this.error, this.trace);
}
