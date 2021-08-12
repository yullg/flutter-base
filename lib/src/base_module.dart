import 'app/cache_manager.dart';
import 'app/directory_manager.dart';
import 'app/key_file_manager.dart';
import 'app/package_info_manager.dart';
import 'app/shared_preferences_manager.dart';
import 'base_config.dart';
import 'core/base_logger.dart';

class BaseModule {
  static BaseConfig? _config;

  static BaseConfig get config => _config!;

  static Future<void> initialize(BaseConfig config) async {
    try {
      _config = config;
      await PackageInfoManager.initialize();
      await SharedPreferenceManager.initialize();
      await DirectoryManager.initialize();
      await KeyFileManager.initialize();
      await CacheManager.initialize();
    } catch (e, s) {
      BaseLogger.fatal("BaseModule initialize error", e, s);
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
      _config = null;
    } catch (e, s) {
      BaseLogger.fatal("BaseModule destroy error", e, s);
      rethrow;
    }
  }

  BaseModule._();
}
