import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../helper/string_helper.dart';
import '../logger/logger.dart';

final Logger _logger = Logger("base.app.config");

class Config {
  static dynamic _defaultSource;
  static dynamic _variantSource;

  static Future<void> initialize(String? defaultConfigFile, String? variantConfigFile) async {
    try {
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
    } catch (e, s) {
      _logger.error("Config initialize failed [ default: $defaultConfigFile, variant: $variantConfigFile ]", e, s);
    }
    await BaseConfig.load();
  }

  static dynamic? find(ParseResult parse(dynamic source, SourceType type)) {
    if (_variantSource != null) {
      try {
        ParseResult parseResult = parse(_variantSource, SourceType.variant_source);
        if (parseResult.complete) {
          return parseResult.result;
        }
      } catch (e, s) {
        _logger.warn("Unable to parse variant config", e, s);
      }
    }
    if (_defaultSource != null) {
      try {
        ParseResult parseResult = parse(_defaultSource, SourceType.default_source);
        if (parseResult.complete) {
          return parseResult.result;
        }
      } catch (e, s) {
        _logger.debug("Unable to parse default config", e, s);
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

  Config._();
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
    _appName = Config.findUntilNotNull((source) => source["appName"]);
    _fileManagerDirectory = Config.findUntilNotNull((source) => source["fileManagerDirectory"]);
    _screen_width = Config.findUntilNotNull((source) => source["screen"]["width"]);
    _screen_height = Config.findUntilNotNull((source) => source["screen"]["height"]);
    _screen_allowFontScaling = Config.findUntilNotNull((source) => source["screen"]["allowFontScaling"]);
    _logger_consoleEnabled = Config.findUntilNotNull((source) => source["logger"]["consoleEnabled"]);
    _logger_consoleLevel = Config.findUntilNotNull((source) => source["logger"]["consoleLevel"]);
    _logger_fileEnabled = Config.findUntilNotNull((source) => source["logger"]["fileEnabled"]);
    _logger_fileLevel = Config.findUntilNotNull((source) => source["logger"]["fileLevel"]);
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
