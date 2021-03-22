import 'package:flutter/foundation.dart';

import '../helper/enum_helper.dart';
import 'logger_conveyer.dart';

abstract class LoggerAppender {
  final Level _level;

  LoggerAppender(this._level);

  void output(LogEvent logEvent) {
    if (logEvent.level.index < _level.index) {
      return;
    }
    doOutput(logEvent);
  }

  void doOutput(LogEvent logEvent);

  String stringifyLogEvent(LogEvent logEvent) {
    StringBuffer result = StringBuffer();
    result.write("${logEvent.loggerName}    ");
    result.write("${logEvent.time.toIso8601String()}    ");
    result.write("${EnumHelper.format(logEvent.level) ?? '---'}    ");
    result.write("${logEvent.message ?? '---'}    ");
    result.writeln("${logEvent.error ?? '---'}    ");
    if (logEvent.trace != null) {
      result.writeln(logEvent.trace);
    }
    return result.toString();
  }
}

class DefaultLoggerAppender extends LoggerAppender {
  DefaultLoggerAppender() : super(Level.trace);

  @override
  void doOutput(LogEvent logEvent) {
    debugPrintThrottled("DefaultLoggerAppender -> " + stringifyLogEvent(logEvent));
  }
}

class ConsoleLoggerAppender extends LoggerAppender {
  ConsoleLoggerAppender(Level level) : super(level);

  @override
  void doOutput(LogEvent logEvent) {
    debugPrintThrottled(stringifyLogEvent(logEvent));
  }
}

class FileLoggerAppender extends LoggerAppender {
  FileLoggerAppender(Level level) : super(level);

  @override
  void doOutput(LogEvent logEvent) {}
}
