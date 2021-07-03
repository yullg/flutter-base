import '../app/base_config.dart';
import '../bean/log_level.dart';
import 'logger_appender.dart';

class LogConveyer {
  static final _consoleLoggerAppender = ConsoleLoggerAppender();
  static final _fileLoggerAppender = FileLoggerAppender();

  static Future<void> convey(Log log) async {
    try {
      if (BaseConfig.logger_consoleEnabled ?? true) {
        if (log.level.index >= (BaseConfig.logger_consoleLevel ?? LogLevel.trace).index) {
          await _consoleLoggerAppender.output(log);
        }
      }
    } finally {
      if (BaseConfig.logger_fileEnabled ?? true) {
        if (log.level.index >= (BaseConfig.logger_fileLevel ?? LogLevel.trace).index) {
          await _fileLoggerAppender.output(log);
        }
      }
    }
  }
}

class Log {
  final String name;
  final LogLevel level;
  final DateTime time;
  final dynamic message;
  final dynamic error;
  final StackTrace? trace;

  Log(this.name, this.level, this.time, this.message, this.error, this.trace);
}
