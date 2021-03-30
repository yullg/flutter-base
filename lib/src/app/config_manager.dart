import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../helper/string_helper.dart';

class ConfigManager {
  static dynamic _defaultSource;
  static dynamic _variantSource;

  static Future<void> initialize(String? defaultConfigFile, String? variantConfigFile) async {
    String? sourceJsonDefault, sourceJsonVariant;
    if (defaultConfigFile != null) {
      sourceJsonDefault = await rootBundle.loadString(defaultConfigFile);
    }
    if (variantConfigFile != null) {
      sourceJsonVariant = await rootBundle.loadString(variantConfigFile);
    }
    if (StringHelper.hasText(sourceJsonDefault)) {
      _defaultSource = jsonDecode(sourceJsonDefault!);
    }
    if (StringHelper.hasText(sourceJsonVariant)) {
      _variantSource = jsonDecode(sourceJsonVariant!);
    }
    await BaseConfig.load();
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
    await BaseConfig.reset();
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

class BaseConfig {
  static String? _appName;
  static String? _fileManagerDirectory;
  static num? _screen_width;
  static num? _screen_height;
  static bool? _screen_allowFontScaling;
  static bool? _logger_consoleEnabled;
  static String? _logger_consoleLevel;
  static bool? _logger_fileEnabled;
  static String? _logger_fileLevel;

  static Future<void> load() async {
    _appName = ConfigManager.findUntilNotNull((source) => source["appName"]);
    _fileManagerDirectory = ConfigManager.findUntilNotNull((source) => source["fileManagerDirectory"]);
    _screen_width = ConfigManager.findUntilNotNull((source) => source["screen"]["width"]);
    _screen_height = ConfigManager.findUntilNotNull((source) => source["screen"]["height"]);
    _screen_allowFontScaling = ConfigManager.findUntilNotNull((source) => source["screen"]["allowFontScaling"]);
    _logger_consoleEnabled = ConfigManager.findUntilNotNull((source) => source["logger"]["consoleEnabled"]);
    _logger_consoleLevel = ConfigManager.findUntilNotNull((source) => source["logger"]["consoleLevel"]);
    _logger_fileEnabled = ConfigManager.findUntilNotNull((source) => source["logger"]["fileEnabled"]);
    _logger_fileLevel = ConfigManager.findUntilNotNull((source) => source["logger"]["fileLevel"]);
  }

  static String? get appName => _appName;

  static String? get fileManagerDirectory => _fileManagerDirectory;

  static num? get screen_width => _screen_width;

  static num? get screen_height => _screen_height;

  static bool? get screen_allowFontScaling => _screen_allowFontScaling;

  static bool? get logger_consoleEnabled => _logger_consoleEnabled;

  static String? get logger_consoleLevel => _logger_consoleLevel;

  static bool? get logger_fileEnabled => _logger_fileEnabled;

  static String? get logger_fileLevel => _logger_fileLevel;

  static Future<void> reset() async {
    _appName = null;
    _fileManagerDirectory = null;
    _screen_width = null;
    _screen_height = null;
    _screen_allowFontScaling = null;
    _logger_consoleEnabled = null;
    _logger_consoleLevel = null;
    _logger_fileEnabled = null;
    _logger_fileLevel = null;
  }

  BaseConfig._();
}
