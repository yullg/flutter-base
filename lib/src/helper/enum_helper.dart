class EnumHelper {
  static String? format(enumItem) {
    if (enumItem == null) return null;
    return enumItem.toString().split('.')[1];
  }

  static T? parseString<T>(Iterable<T>? enumValues, String? value) {
    if (enumValues == null || value == null) return null;
    return enumValues.singleWhere((element) => format(element) == value);
  }

  static T? parseInt<T>(Iterable<T>? enumValues, int? value) {
    if (enumValues == null || value == null || enumValues.length <= value) return null;
    return enumValues.elementAt(value);
  }

  EnumHelper._();
}
