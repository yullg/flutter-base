class StringHelper {
  static bool hasLength(String? str) {
    return (str != null && str.isNotEmpty);
  }

  static bool hasNotLength(String? str) => !hasLength(str);

  static bool hasText(String? str) {
    return (str != null && str.trim().isNotEmpty);
  }

  static bool hasNotText(String? str) => !hasText(str);

  static bool equals(String? strA, String? strB, {bool trim = true}) {
    if (trim) {
      return (strA?.trim() ?? "") == (strB?.trim() ?? "");
    } else {
      return (strA ?? "") == (strB ?? "");
    }
  }

  StringHelper._();
}
