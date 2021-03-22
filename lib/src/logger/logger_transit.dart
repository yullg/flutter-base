import 'dart:async';
import 'dart:convert';

import 'package:base/base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'logger_appender.dart';

/// LoggerTransit采用后期干预模式加载配置，这意味着在配置加载之前将按照默认行为运行，并且无法修改。
class LoggerTransit {
  static final LoggerTransit instance = LoggerTransit._();

  final StreamController<LogEvent> _streamController = StreamController.broadcast();

  LoggerTransit._() {
    var defaultStreamSubscription = _streamController.stream.listen(DefaultLoggerAppender().output, onError: (e) {});
    rootBundle.loadString("assets/logger.json").then((value) {
      if (StringHelper.hasText(value)) {
        dynamic loggerConfig = jsonDecode(value);
        if (loggerConfig["consoleEnabled"] ?? false) {
          _streamController.stream.listen(
              ConsoleLoggerAppender(EnumHelper.parseString(Level.values, loggerConfig["consoleLevel"]) ?? Level.info)
                  .output,
              onError: (e) {});
        }
        if (loggerConfig["fileEnabled"] ?? false) {
          _streamController.stream.listen(
              FileLoggerAppender(EnumHelper.parseString(Level.values, loggerConfig["fileLevel"]) ?? Level.info).output,
              onError: (e) {});
        }
      }
    }).catchError((e) {
      debugPrintThrottled("Unable to load logger config : $e");
    }).whenComplete(() => defaultStreamSubscription.cancel());
  }

  void log(LogEvent logEvent) {
    _streamController.add(logEvent);
  }
}

enum Level { trace, debug, info, warn, error, fatal }

class LogEvent {
  final String loggerName;
  final Level level;
  final DateTime time;
  final dynamic message;
  final dynamic? error;
  final StackTrace? trace;

  LogEvent(this.loggerName, this.level, this.time, this.message, this.error, this.trace);
}
