class StringHelper {
  static bool hasLength(String? str) {
    return (str != null && str.isNotEmpty);
  }

  static bool hasNotLength(String? str) => !hasLength(str);

  static bool hasText(String? str) {
    return (str != null && str.trim().isNotEmpty);
  }

  static bool hasNotText(String? str) => !hasText(str);

  StringHelper._();
}
