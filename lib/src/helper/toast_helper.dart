import 'dart:convert';

import '../core/base_plugin_channel.dart';

class ToastHelper {
  static void show(String text, {bool durable = false}) {
    BasePluginChannel.invokeMethod("showToast", jsonEncode({"text": text, "durable": durable})).catchError((e) {});
  }

  static void hide() {
    BasePluginChannel.invokeMethod("hideToast").catchError((e) {});
  }

  ToastHelper._();
}
