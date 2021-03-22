import 'package:flutter/services.dart';

class BasePluginChannel {
  static final _methodChannel = MethodChannel("com.yullg.base/method");

  static Future<T?> invokeMethod<T>(String method, [dynamic arguments]) async {
    return _methodChannel.invokeMethod(method, arguments);
  }

  BasePluginChannel._();
}
