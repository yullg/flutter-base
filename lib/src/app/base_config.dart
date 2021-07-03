import '../bean/log_level.dart';
import '../helper/enum_helper.dart';
import 'config_manager.dart';

class BaseConfig {
  static bool? _debug;
  static String? _fileManagerDirectory;
  static String? _globalCacheManager_cacheKey;
  static int? _globalCacheManager_stalePeriod;
  static int? _globalCacheManager_maxNrOfCacheObjects;
  static bool? _logger_consoleEnabled;
  static LogLevel? _logger_consoleLevel;
  static bool? _logger_fileEnabled;
  static LogLevel? _logger_fileLevel;

  static Future<void> initialize() async {
    _debug = ConfigManager.findUntilNotNull((source) => source["base"]?["debug"]);
    _fileManagerDirectory = ConfigManager.findUntilNotNull((source) => source["base"]?["fileManagerDirectory"]);
    _globalCacheManager_cacheKey = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["cacheKey"]);
    _globalCacheManager_stalePeriod = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["stalePeriod"]);
    _globalCacheManager_maxNrOfCacheObjects =
        ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["maxNrOfCacheObjects"]);
    _logger_consoleEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleEnabled"]);
    _logger_consoleLevel =
        EnumHelper.parseString(LogLevel.values, ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleLevel"]));
    _logger_fileEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileEnabled"]);
    _logger_fileLevel = EnumHelper.parseString(LogLevel.values, ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileLevel"]));
  }

  static bool? get debug => _debug;

  static String? get fileManagerDirectory => _fileManagerDirectory;

  static String? get globalCacheManager_cacheKey => _globalCacheManager_cacheKey;

  static int? get globalCacheManager_stalePeriod => _globalCacheManager_stalePeriod;

  static int? get globalCacheManager_maxNrOfCacheObjects => _globalCacheManager_maxNrOfCacheObjects;

  static bool? get logger_consoleEnabled => _logger_consoleEnabled;

  static LogLevel? get logger_consoleLevel => _logger_consoleLevel;

  static bool? get logger_fileEnabled => _logger_fileEnabled;

  static LogLevel? get logger_fileLevel => _logger_fileLevel;

  static Future<void> destroy() async {
    _debug = null;
    _fileManagerDirectory = null;
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
