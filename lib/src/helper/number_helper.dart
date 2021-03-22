import 'package:intl/intl.dart';

class NumberHelper {
  static String? format(num? number, String? pattern) {
    if (number == null || pattern == null) return null;
    return NumberFormat(pattern).format(number);
  }

  NumberHelper._();
}
