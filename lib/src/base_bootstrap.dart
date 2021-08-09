import 'package:flutter/widgets.dart';

import 'app/base_config.dart';
import 'app/cache_manager.dart';
import 'app/config_manager.dart';
import 'app/directory_manager.dart';
import 'app/key_file_manager.dart';
import 'app/package_info_manager.dart';
import 'app/shared_preferences_manager.dart';
import 'logger/base_logger.dart';

class BaseBootstrap {
  static Future<void> initialize(BuildContext context, {String? defaultConfigJson, String? variantConfigJson}) async {
    try {
      await ConfigManager.initialize(defaultConfigJson, variantConfigJson);
      await BaseConfig.initialize();
      await PackageInfoManager.initialize();
      await SharedPreferenceManager.initialize();
      await DirectoryManager.initialize();
      await KeyFileManager.initialize();
      await CacheManager.initialize();
    } catch (e, s) {
      BaseLogger.fatal("BaseBootstrap initialize error", e, s);
      rethrow;
    }
  }

  static Future<void> destroy() async {
    try {
      await CacheManager.destroy();
      await KeyFileManager.destroy();
      await DirectoryManager.destroy();
      await SharedPreferenceManager.destroy();
      await PackageInfoManager.destroy();
      await BaseConfig.destroy();
      await ConfigManager.destroy();
    } catch (e, s) {
      BaseLogger.fatal("BaseBootstrap destroy error", e, s);
      rethrow;
    }
  }

  BaseBootstrap._();
}
