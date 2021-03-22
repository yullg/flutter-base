import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  static SharedPreferences? _instance;

  static Future<void> initialize() async {
    _instance = await SharedPreferences.getInstance();
  }

  static SharedPreferences get instance => _instance!;

  static Future<void> destroy() async {
    _instance = null;
  }

  SharedPreferenceManager._();
}
