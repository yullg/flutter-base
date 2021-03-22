import 'package:flutter/widgets.dart';

import 'app/config.dart';
import 'app/directory_manager.dart';
import 'app/file_manager.dart';
import 'app/shared_preferences_manager.dart';

class BaseBootstrap {
  static Future<void> initialize(BuildContext context,
      {String configBaseName = "application", String? configVariantName}) async {
    await Config.initialize(configBaseName, configVariantName);
    await DirectoryManager.initialize();
    await FileManager.initialize();
    await SharedPreferenceManager.initialize();
  }

  static Future<void> destroy() async {
    await SharedPreferenceManager.destroy();
    await FileManager.destroy();
    await DirectoryManager.destroy();
    await Config.destroy();
  }

  BaseBootstrap._();
}
