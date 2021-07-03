import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../helper/datetime_helper.dart';
import '../helper/enum_helper.dart';
import 'base_logger.dart';
import 'logger_conveyer.dart';

abstract class LoggerAppender {
  const LoggerAppender();

  Future<void> output(Log log);

  String stringifyLogEvent(Log log) {
    StringBuffer result = StringBuffer();
    result.write("${log.name}    ");
    result.write("${log.time.toIso8601String()}    ");
    result.write("${EnumHelper.format(log.level) ?? '---'}    ");
    result.write("${log.message ?? '---'}    ");
    result.writeln("${log.error ?? '---'}    ");
    if (log.trace != null) {
      result.writeln(log.trace);
    }
    return result.toString();
  }
}

class ConsoleLoggerAppender extends LoggerAppender {
  @override
  Future<void> output(Log log) async {
    debugPrintThrottled(stringifyLogEvent(log));
  }
}

class FileLoggerAppender extends LoggerAppender {
  FileLoggerAppender() {
    _deleteLogFile(30).catchError((e, s) {
      BaseLogger.error("FileLoggerAppender#_deleteLogFile(30) error", e, s);
    });
  }

  @override
  Future<void> output(Log log) async {
    var temporaryDirectory = await getTemporaryDirectory();
    var logFile = File(p.join(temporaryDirectory.absolute.path, "yullg", "log", "log-${DateTimeHelper.format(DateTime.now(), 'yyyyMMdd')}.log"));
    logFile.createSync(recursive: true);
    logFile.writeAsStringSync(stringifyLogEvent(log), mode: FileMode.append);
  }

  static final _logFileNameRegExp = RegExp(r"^log-(\d{4})(\d{2})(\d{2})\.log$");

  Future<void> _deleteLogFile(int days) async {
    var logDirectory = Directory(p.join((await getTemporaryDirectory()).absolute.path, "yullg", "log"));
    if (!logDirectory.existsSync()) return;
    var fileSystemEntities = logDirectory.listSync(followLinks: false);
    var minDateTime = DateTime.now().subtract(Duration(days: days));
    for (var fileSystemEntity in fileSystemEntities) {
      if (fileSystemEntity is File) {
        var fileName = p.basename(fileSystemEntity.path);
        var regExpMatch = _logFileNameRegExp.firstMatch(fileName);
        if (regExpMatch != null) {
          var year = int.parse(regExpMatch.group(1)!), month = int.parse(regExpMatch.group(2)!), day = int.parse(regExpMatch.group(3)!);
          var logDateTime = DateTime(year, month, day);
          if (logDateTime.isBefore(minDateTime)) {
            fileSystemEntity.deleteSync();
          }
        }
      }
    }
  }
}
