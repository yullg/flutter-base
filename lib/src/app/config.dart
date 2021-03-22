import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../helper/string_helper.dart';
import '../logger/logger.dart';

final Logger _logger = Logger("base.app.config");

class Config {
  static dynamic? _defaultSource;
  static dynamic? _variantSource;

  static Future<void> initialize(String? baseName, String? variantName) async {
    String? sourceJsonDefault, sourceJsonVariant;
    try {
      try {
        if (baseName != null) {
          sourceJsonDefault = await rootBundle.loadString("assets/$baseName.json");
        }
      } finally {
        if (baseName != null && variantName != null) {
          sourceJsonVariant = await rootBundle.loadString("assets/$baseName-$variantName.json");
        }
      }
    } catch (e) {} finally {
      _logger.warn(
          "Load config file [$baseName/$variantName : ${sourceJsonDefault?.length ?? -1}/${sourceJsonVariant?.length ?? -1}]");
    }
    try {
      if (StringHelper.hasText(sourceJsonDefault)) _defaultSource = jsonDecode(sourceJsonDefault!);
    } catch (e, s) {
      _logger.error("Unable to decode default config [$baseName]", e, s);
    }
    try {
      if (StringHelper.hasText(sourceJsonVariant)) _variantSource = jsonDecode(sourceJsonVariant!);
    } catch (e, s) {
      _logger.error("Unable to decode variant config [$baseName/$variantName]", e, s);
    }
    await BaseConfig.load();
  }

  static dynamic? find(ParseResult parse(dynamic source, SourceType type)) {
    try {
      if (_variantSource != null) {
        ParseResult result_parse_variant = parse(_variantSource, SourceType.variant_source);
        if (result_parse_variant.complete) {
          return result_parse_variant.result;
        }
      }
    } catch (e, s) {
      _logger.debug("Unable to parse variant config", e, s);
    }
    try {
      if (_defaultSource != null) {
        ParseResult result_parse_default = parse(_defaultSource, SourceType.default_source);
        if (result_parse_default.complete) {
          return result_parse_default.result;
        }
      }
    } catch (e, s) {
      _logger.debug("Unable to parse default config", e, s);
    }
    return null;
  }

  static dynamic findUntilNotNull(dynamic? parse(dynamic source)) {
    return find((source, type) {
      dynamic? result = parse(source);
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
  final dynamic? result;

  ParseResult(this.complete, this.result);
}

class BaseConfig {
  static String? _appName;
  static String? _subDirectory;
  static num? _screen_width;
  static num? _screen_height;
  static bool? _screen_allowFontScaling;

  static Future<void> load() async {
    _appName = Config.findUntilNotNull((source) => source["appName"]);
    _subDirectory = Config.findUntilNotNull((source) => source["subDirectory"]);
    _screen_width = Config.findUntilNotNull((source) => source["screen"]["width"]);
    _screen_height = Config.findUntilNotNull((source) => source["screen"]["height"]);
    _screen_allowFontScaling = Config.findUntilNotNull((source) => source["screen"]["allowFontScaling"]);
  }

  static String? get appName => _appName;

  static String? get subDirectory => _subDirectory;

  static num? get screen_width => _screen_width;

  static num? get screen_height => _screen_height;

  static bool? get screen_allowFontScaling => _screen_allowFontScaling;

  static Future<void> reset() async {
    _appName = null;
    _subDirectory = null;
    _screen_width = null;
    _screen_height = null;
    _screen_allowFontScaling = null;
  }

  BaseConfig._();
}
