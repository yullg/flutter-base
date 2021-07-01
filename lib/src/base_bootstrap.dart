import 'package:flutter/widgets.dart';

import 'app/base_config.dart';
import 'app/cache_manager.dart';
import 'app/config_manager.dart';
import 'app/directory_manager.dart';
import 'app/download_manager.dart';
import 'app/file_manager.dart';
import 'app/logger_manager.dart';
import 'app/mqtt_manager.dart';
import 'app/package_info_manager.dart';
import 'app/shared_preferences_manager.dart';
import 'logger/system_logger.dart';

class BaseBootstrap {
  static Future<void> initialize(BuildContext context, {String? defaultConfigJson, String? variantConfigJson}) async {
    try {
      await ConfigManager.initialize(defaultConfigJson, variantConfigJson);
      await BaseConfig.initialize();
      await PackageInfoManager.initialize();
      await SharedPreferenceManager.initialize();
      await LoggerManager.initialize();
      await DirectoryManager.initialize();
      await FileManager.initialize();
      await CacheManager.initialize();
      await DownloadManager.initialize();
      await MqttManager.initialize();
    } catch (e, s) {
      SystemLogger.log("BaseBootstrap initialize error", e, s);
      rethrow;
    }
  }

  static Future<void> destroy() async {
    try {
      await MqttManager.destroy();
      await DownloadManager.destroy();
      await CacheManager.destroy();
      await FileManager.destroy();
      await DirectoryManager.destroy();
      await LoggerManager.destroy();
      await SharedPreferenceManager.destroy();
      await PackageInfoManager.destroy();
      await BaseConfig.destroy();
      await ConfigManager.destroy();
    } catch (e, s) {
      SystemLogger.log("BaseBootstrap destroy error", e, s);
      rethrow;
    }
  }

  BaseBootstrap._();
}
