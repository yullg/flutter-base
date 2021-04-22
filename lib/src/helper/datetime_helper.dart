import 'package:intl/intl.dart';

final DateFormat _HHmm = DateFormat("HH:mm");
final DateFormat _MMddHHmm = DateFormat("MM-dd HH:mm");
final DateFormat _yyyyMMdd = DateFormat("yyyy-MM-dd");

class DateTimeHelper {
  static String? format(DateTime? dateTime, String? pattern) {
    if (dateTime == null || pattern == null) return null;
    return DateFormat(pattern).format(dateTime);
  }

  static String? smartFormat(DateTime? dateTime) {
    if (dateTime == null) return null;
    DateTime now = DateTime.now();
    Duration diff = now.difference(dateTime);
    if (diff.isNegative) {
      if (diff.inSeconds.abs() < 60) {
        return "几秒后";
      } else if (diff.inMinutes.abs() < 2) {
        return "1分钟后";
      } else if (diff.inMinutes.abs() < 60) {
        return "${diff.inMinutes.abs()} 分钟后";
      }
    } else {
      if (diff.inSeconds.abs() < 60) {
        return "刚刚";
      } else if (diff.inMinutes.abs() < 2) {
        return "1分钟前";
      } else if (diff.inMinutes.abs() < 60) {
        return "${diff.inMinutes.abs()} 分钟前";
      }
    }
    if (isYesterday(dateTime, now)) {
      return "昨天 ${_HHmm.format(dateTime)}";
    }
    if (isTomorrow(dateTime, now)) {
      return "明天 ${_HHmm.format(dateTime)}";
    }
    if (isSameDay(now, dateTime)) {
      return _HHmm.format(dateTime);
    }
    if (isSameYear(now, dateTime)) {
      return _MMddHHmm.format(dateTime);
    }
    return _yyyyMMdd.format(dateTime);
  }

  static bool isSameYear(DateTime? dt1, DateTime? dt2) {
    if (dt1 == null || dt2 == null) return false;
    return dt1.year == dt2.year;
  }

  static bool isSameMonth(DateTime? dt1, DateTime? dt2) {
    if (dt1 == null || dt2 == null) return false;
    return dt1.year == dt2.year && dt1.month == dt2.month;
  }

  static bool isSameDay(DateTime? dt1, DateTime? dt2) {
    if (dt1 == null || dt2 == null) return false;
    return dt1.year == dt2.year && dt1.month == dt2.month && dt1.day == dt2.day;
  }

  static bool isYesterday(DateTime? dateTime, [DateTime? now]) {
    if (dateTime == null) return false;
    return isSameDay(dateTime.add(Duration(days: 1)), now ?? DateTime.now());
  }

  static bool isTomorrow(DateTime? dateTime, [DateTime? now]) {
    if (dateTime == null) return false;
    return isSameDay(dateTime.add(Duration(days: -1)), now ?? DateTime.now());
  }

  DateTimeHelper._();
}
