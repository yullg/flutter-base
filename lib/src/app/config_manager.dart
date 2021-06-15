import 'dart:convert';

import '../helper/string_helper.dart';

class ConfigManager {
  static dynamic _defaultSource;
  static dynamic _variantSource;

  static Future<void> initialize(String? defaultConfigJson, String? variantConfigJson) async {
    if (StringHelper.hasText(defaultConfigJson)) {
      _defaultSource = jsonDecode(defaultConfigJson!);
    }
    if (StringHelper.hasText(variantConfigJson)) {
      _variantSource = jsonDecode(variantConfigJson!);
    }
    await Config.load();
  }

  static dynamic find(ParseResult parse(dynamic source, SourceType type)) {
    if (_variantSource != null) {
      ParseResult parseResult = parse(_variantSource, SourceType.variant_source);
      if (parseResult.complete) {
        return parseResult.result;
      }
    }
    if (_defaultSource != null) {
      ParseResult parseResult = parse(_defaultSource, SourceType.default_source);
      if (parseResult.complete) {
        return parseResult.result;
      }
    }
    return null;
  }

  static dynamic findUntilNotNull(dynamic parse(dynamic source)) {
    return find((source, type) {
      dynamic result = parse(source);
      return ParseResult(result != null, result);
    });
  }

  static Future<void> destroy() async {
    await Config.reset();
    _defaultSource = null;
    _variantSource = null;
  }

  ConfigManager._();
}

enum SourceType { default_source, variant_source }

class ParseResult {
  final bool complete;
  final dynamic result;

  ParseResult(this.complete, this.result);
}

class Config {
  static bool? _debug;
  static String? _fileManagerDirectory;
  static String? _globalCacheManager_cacheKey;
  static int? _globalCacheManager_stalePeriod;
  static int? _globalCacheManager_maxNrOfCacheObjects;
  static bool? _logger_consoleEnabled;
  static String? _logger_consoleLevel;
  static bool? _logger_fileEnabled;
  static String? _logger_fileLevel;

  static Future<void> load() async {
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

  static Future<void> reset() async {
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

  Config._();
}
