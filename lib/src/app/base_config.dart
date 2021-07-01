import 'config_manager.dart';

class BaseConfig {
  static bool? _debug;
  static String? _fileManagerDirectory;
  static String? _globalCacheManager_cacheKey;
  static int? _globalCacheManager_stalePeriod;
  static int? _globalCacheManager_maxNrOfCacheObjects;
  static bool? _logger_consoleEnabled;
  static String? _logger_consoleLevel;
  static bool? _logger_fileEnabled;
  static String? _logger_fileLevel;
  static bool? _mqtt_enabled;
  static String? _mqtt_server;
  static String? _mqtt_clientIdentifier;
  static int? _mqtt_port;
  static bool? _mqtt_logging;
  static int? _mqtt_keepAlivePeriod;
  static String? _mqtt_username;
  static String? _mqtt_password;
  static List<int>? _mqtt_certificate;

  static Future<void> initialize() async {
    _debug = ConfigManager.findUntilNotNull((source) => source["base"]?["debug"]);
    _fileManagerDirectory = ConfigManager.findUntilNotNull((source) => source["base"]?["fileManagerDirectory"]);
    _globalCacheManager_cacheKey = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["cacheKey"]);
    _globalCacheManager_stalePeriod = ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["stalePeriod"]);
    _globalCacheManager_maxNrOfCacheObjects =
        ConfigManager.findUntilNotNull((source) => source["base"]?["globalCacheManager"]?["maxNrOfCacheObjects"]);
    _logger_consoleEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleEnabled"]);
    _logger_consoleLevel = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["consoleLevel"]);
    _logger_fileEnabled = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileEnabled"]);
    _logger_fileLevel = ConfigManager.findUntilNotNull((source) => source["base"]?["logger"]?["fileLevel"]);
    _mqtt_enabled = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["enabled"]);
    _mqtt_server = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["server"]);
    _mqtt_clientIdentifier = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["clientIdentifier"]);
    _mqtt_port = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["port"]);
    _mqtt_logging = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["logging"]);
    _mqtt_keepAlivePeriod = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["keepAlivePeriod"]);
    _mqtt_username = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["username"]);
    _mqtt_password = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["password"]);
    _mqtt_certificate = ConfigManager.findUntilNotNull((source) => source["base"]?["mqtt"]?["certificate"])?.cast<int>();
  }

  static bool? get debug => _debug;

  static String? get fileManagerDirectory => _fileManagerDirectory;

  static String? get globalCacheManager_cacheKey => _globalCacheManager_cacheKey;

  static int? get globalCacheManager_stalePeriod => _globalCacheManager_stalePeriod;

  static int? get globalCacheManager_maxNrOfCacheObjects => _globalCacheManager_maxNrOfCacheObjects;

  static bool? get logger_consoleEnabled => _logger_consoleEnabled;

  static String? get logger_consoleLevel => _logger_consoleLevel;

  static bool? get logger_fileEnabled => _logger_fileEnabled;

  static String? get logger_fileLevel => _logger_fileLevel;

  static bool? get mqtt_enabled => _mqtt_enabled;

  static String? get mqtt_server => _mqtt_server;

  static String? get mqtt_clientIdentifier => _mqtt_clientIdentifier;

  static int? get mqtt_port => _mqtt_port;

  static bool? get mqtt_logging => _mqtt_logging;

  static int? get mqtt_keepAlivePeriod => _mqtt_keepAlivePeriod;

  static String? get mqtt_username => _mqtt_username;

  static String? get mqtt_password => _mqtt_password;

  static List<int>? get mqtt_certificate => _mqtt_certificate;

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
    _mqtt_enabled = null;
    _mqtt_server = null;
    _mqtt_clientIdentifier = null;
    _mqtt_port = null;
    _mqtt_logging = null;
    _mqtt_keepAlivePeriod = null;
    _mqtt_username = null;
    _mqtt_password = null;
    _mqtt_certificate = null;
  }

  BaseConfig._();
}
