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
