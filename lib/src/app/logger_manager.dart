import '../logger/logger_conveyer.dart';

class LoggerManager {
  static Future<void> initialize() async {
    await LogConveyer.initialize();
  }

  static Future<void> destroy() async {
    await LogConveyer.destroy();
  }

  LoggerManager._();
}
