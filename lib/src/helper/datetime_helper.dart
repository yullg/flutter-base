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
      } else if (diff.inDays.abs() == 1) {
        return "明天 ${_HHmm.format(dateTime)}";
      }
    } else {
      if (diff.inSeconds.abs() < 60) {
        return "刚刚";
      } else if (diff.inMinutes.abs() < 2) {
        return "1分钟前";
      } else if (diff.inMinutes.abs() < 60) {
        return "${diff.inMinutes.abs()} 分钟前";
      } else if (diff.inDays.abs() == 1) {
        return "昨天 ${_HHmm.format(dateTime)}";
      }
    }
    if (now.year == dateTime.year && now.month == dateTime.month && now.day == dateTime.day) {
      return _HHmm.format(dateTime);
    } else if (now.year == dateTime.year && now.month == dateTime.month) {
      return _MMddHHmm.format(dateTime);
    } else {
      return _yyyyMMdd.format(dateTime);
    }
  }

  DateTimeHelper._();
}
