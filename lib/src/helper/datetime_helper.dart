import 'package:intl/intl.dart';

final DateFormat _HHmm = DateFormat("HH:mm");
final DateFormat _MMddHHmm = DateFormat("MM-dd HH:mm");
final DateFormat _yyyyMMdd = DateFormat("yyyy-MM-dd");
final String _capricorn = '摩羯座'; //12月22日～1月20日
final String _aquarius = '水瓶座'; //1月21日～2月19日
final String _pisces = '双鱼座'; //2月20日～3月20日
final String _aries = '白羊座'; //3月21日～4月20日
final String _taurus = '金牛座'; //4月21～5月21日
final String _gemini = '双子座'; //5月22日～6月21日
final String _cancer = '巨蟹座'; //6月22日～7月22日
final String _leo = '狮子座'; //7月23日～8月23日
final String _virgo = '处女座'; //8月24日～9月23日
final String _libra = '天秤座'; //9月24日～10月23日
final String _scorpio = '天蝎座'; //10月24日～11月22日
final String _sagittarius = '射手座'; //11月23日～12月21日

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

  static String? constellation(DateTime? birthday) {
    if (birthday != null) {
      switch (birthday.month) {
        case DateTime.january:
          return birthday.day < 21 ? _capricorn : _aquarius;
        case DateTime.february:
          return birthday.day < 20 ? _aquarius : _pisces;
        case DateTime.march:
          return birthday.day < 21 ? _pisces : _aries;
        case DateTime.april:
          return birthday.day < 21 ? _aries : _taurus;
        case DateTime.may:
          return birthday.day < 22 ? _taurus : _gemini;
        case DateTime.june:
          return birthday.day < 22 ? _gemini : _cancer;
        case DateTime.july:
          return birthday.day < 23 ? _cancer : _leo;
        case DateTime.august:
          return birthday.day < 24 ? _leo : _virgo;
        case DateTime.september:
          return birthday.day < 24 ? _virgo : _libra;
        case DateTime.october:
          return birthday.day < 24 ? _libra : _scorpio;
        case DateTime.november:
          return birthday.day < 23 ? _scorpio : _sagittarius;
        case DateTime.december:
          return birthday.day < 22 ? _sagittarius : _capricorn;
      }
    }
    return null;
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
