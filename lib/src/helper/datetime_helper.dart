import 'package:intl/intl.dart';

class DateTimeHelper {
  static String? format(DateTime? dateTime, String? pattern) {
    if (dateTime == null || pattern == null) return null;
    return DateFormat(pattern).format(dateTime);
  }

  static String? fromNow(DateTime? dateTime, [bool withoutPrefixOrSuffix = false]) {
    if (dateTime == null) return null;
    Duration diff = DateTime.now().difference(dateTime);
    String timeString;
    if (diff.inSeconds.abs() < 45) {
      timeString = "几秒";
    } else if (diff.inMinutes.abs() < 2) {
      timeString = "1 分钟";
    } else if (diff.inMinutes.abs() < 45) {
      timeString = "${diff.inMinutes.abs()} 分钟";
    } else if (diff.inHours.abs() < 2) {
      timeString = "1 小时";
    } else if (diff.inHours.abs() < 22) {
      timeString = "${diff.inHours.abs()} 小时";
    } else if (diff.inDays.abs() < 2) {
      timeString = "1 天";
    } else if (diff.inDays.abs() < 26) {
      timeString = "${diff.inDays.abs()} 天";
    } else if (diff.inDays.abs() < 60) {
      timeString = "1 个月";
    } else if (diff.inDays.abs() < 320) {
      timeString = "${diff.inDays.abs() ~/ 30} 个月";
    } else if (diff.inDays.abs() < 547) {
      timeString = "1 年";
    } else {
      timeString = "${diff.inDays.abs() ~/ 356} 年";
    }
    if (!withoutPrefixOrSuffix) {
      if (diff.isNegative) {
        timeString = "$timeString后";
      } else {
        timeString = "$timeString前";
      }
    }
    return timeString;
  }

  DateTimeHelper._();
}
