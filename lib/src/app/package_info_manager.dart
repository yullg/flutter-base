import 'package:package_info/package_info.dart';

class PackageInfoManager {
  static PackageInfo? _packageInfo;

  static Future<void> initialize() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  static String get appName => _packageInfo!.appName;

  static String get versionName => _packageInfo!.version;

  static String get versionCode => _packageInfo!.buildNumber;

  static String get packageName => _packageInfo!.packageName;

  static Future<void> destroy() async {
    _packageInfo = null;
  }

  PackageInfoManager._();
}
