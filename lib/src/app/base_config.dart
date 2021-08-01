import 'config_manager.dart';

class BaseConfig {
  static String? _keyFileManagerDirectory;
  static String? _globalCacheManager_cacheKey;
  static int? _globalCacheManager_stalePeriod;
  static int? _globalCacheManager_maxNrOfCacheObjects;
  static bool? _logger_consoleEnabled;
  static int? _logger_consoleLevel;
  static bool? _logger_fileEnabled;
  static int? _logger_fileLevel;

  static Future<void> initialize() async {
    _keyFileManagerDirectory = ConfigManager.findUntilNotNull((source) => source["base"]?["keyFileManagerDirectory"]);
    _globalCacheManager_cacheKey = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["cacheKey"]);
    _globalCacheManager_stalePeriod = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["stalePeriod"]);
    _globalCacheManager_maxNrOfCacheObjects =
        ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["maxNrOfCacheObjects"]);
    _logger_consoleEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleEnabled"]);
    _logger_consoleLevel = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleLevel"]);
    _logger_fileEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileEnabled"]);
    _logger_fileLevel = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileLevel"]);
  }

  static String? get keyFileManagerDirectory => _keyFileManagerDirectory;

  static String? get globalCacheManager_cacheKey => _globalCacheManager_cacheKey;

  static int? get globalCacheManager_stalePeriod => _globalCacheManager_stalePeriod;

  static int? get globalCacheManager_maxNrOfCacheObjects => _globalCacheManager_maxNrOfCacheObjects;

  static bool? get logger_consoleEnabled => _logger_consoleEnabled;

  static int? get logger_consoleLevel => _logger_consoleLevel;

  static bool? get logger_fileEnabled => _logger_fileEnabled;

  static int? get logger_fileLevel => _logger_fileLevel;

  static Future<void> destroy() async {
    _keyFileManagerDirectory = null;
    _globalCacheManager_cacheKey = null;
    _globalCacheManager_stalePeriod = null;
    _globalCacheManager_maxNrOfCacheObjects = null;
    _logger_consoleEnabled = null;
    _logger_consoleLevel = null;
    _logger_fileEnabled = null;
    _logger_fileLevel = null;
  }

  BaseConfig._();
}
