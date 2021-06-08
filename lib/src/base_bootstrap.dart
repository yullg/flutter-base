import 'package:flutter/widgets.dart';

import 'app/cache_manager.dart';
import 'app/config_manager.dart';
import 'app/directory_manager.dart';
import 'app/download_manager.dart';
import 'app/file_manager.dart';
import 'app/logger_manager.dart';
import 'app/package_info_manager.dart';
import 'app/shared_preferences_manager.dart';

class BaseBootstrap {
  static Future<void> initialize(BuildContext context, {String? defaultConfigFile, String? variantConfigFile}) async {
    await ConfigManager.initialize(defaultConfigFile, variantConfigFile);
    await PackageInfoManager.initialize();
    await SharedPreferenceManager.initialize();
    await LoggerManager.initialize();
    await DirectoryManager.initialize();
    await FileManager.initialize();
    await CacheManager.initialize();
    await DownloadManager.initialize();
  }

  static Future<void> destroy() async {
    await DownloadManager.destroy();
    await CacheManager.destroy();
    await FileManager.destroy();
    await DirectoryManager.destroy();
    await LoggerManager.destroy();
    await SharedPreferenceManager.destroy();
    await PackageInfoManager.destroy();
    await ConfigManager.destroy();
  }

  BaseBootstrap._();
}
