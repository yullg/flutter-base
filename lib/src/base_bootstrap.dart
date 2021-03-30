import 'package:flutter/widgets.dart';

import 'app/config_manager.dart';
import 'app/directory_manager.dart';
import 'app/file_manager.dart';
import 'app/logger_manager.dart';
import 'app/shared_preferences_manager.dart';

class BaseBootstrap {
  static Future<void> initialize(BuildContext context, {String? defaultConfigFile, String? variantConfigFile}) async {
    await ConfigManager.initialize(defaultConfigFile, variantConfigFile);
    await LoggerManager.initialize();
    await DirectoryManager.initialize();
    await FileManager.initialize();
    await SharedPreferenceManager.initialize();
  }

  static Future<void> destroy() async {
    await SharedPreferenceManager.destroy();
    await FileManager.destroy();
    await DirectoryManager.destroy();
    await LoggerManager.destroy();
    await ConfigManager.destroy();
  }

  BaseBootstrap._();
}
