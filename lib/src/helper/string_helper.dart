class StringHelper {
  /// 空字符
  static const String EMPTY_STRING = "";

  /// 斗角空格
  static const String EN_SPACE_STRING = "\u0020";

  /// 全角空格
  static const String EM_SPACE_STRING = "\u3000";

  static bool hasLength(String? str) {
    return (str != null && str.isNotEmpty);
  }

  static bool hasNotLength(String? str) => !hasLength(str);

  static bool hasText(String? str) {
    return (str != null && str.trim().isNotEmpty);
  }

  static bool hasNotText(String? str) => !hasText(str);

  static bool textEquals(String? strA, String? strB, {bool trim = true}) {
    if (trim) {
      return (strA?.trim() ?? EMPTY_STRING) == (strB?.trim() ?? EMPTY_STRING);
    } else {
      return (strA ?? EMPTY_STRING) == (strB ?? EMPTY_STRING);
    }
  }

  StringHelper._();
}
