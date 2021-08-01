import 'package:flutter/foundation.dart';

import '../app/base_config.dart';
import 'logger_appender.dart';

class LogConveyer {
  static const _defaultConsoleEnabled = kReleaseMode ? false : true;
  static const _defaultConsoleLevel = kReleaseMode ? LogLevel.warn : LogLevel.trace;
  static const _defaultFileEnabled = kReleaseMode ? false : true;
  static const _defaultFileLevel = kReleaseMode ? LogLevel.warn : LogLevel.trace;
  static final _consoleLoggerAppender = ConsoleLoggerAppender();
  static final _fileLoggerAppender = FileLoggerAppender();

  static Future<void> convey(Log log) async {
    try {
      if (BaseConfig.logger_consoleEnabled ?? _defaultConsoleEnabled) {
        if (log.level.index >= (BaseConfig.logger_consoleLevel ?? _defaultConsoleLevel.index)) {
          await _consoleLoggerAppender.output(log);
        }
      }
    } finally {
      if (BaseConfig.logger_fileEnabled ?? _defaultFileEnabled) {
        if (log.level.index >= (BaseConfig.logger_fileLevel ?? _defaultFileLevel.index)) {
          await _fileLoggerAppender.output(log);
        }
      }
    }
  }
}

enum LogLevel { trace, debug, info, warn, error, fatal }

class Log {
  final String module;
  final String name;
  final LogLevel level;
  final DateTime time;
  final dynamic message;
  final dynamic error;
  final StackTrace? trace;

  Log(this.module, this.name, this.level, this.time, this.message, this.error, this.trace);
}
