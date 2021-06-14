import 'dart:convert';
import 'dart:io';

import '../core/base_plugin_channel.dart';

class ExifHelper {
  static Future<int> getRotationDegrees(File file) async {
    return (await BasePluginChannel.invokeMethod<int>("getRotationDegrees", jsonEncode({"path": file.path})))!;
  }

  ExifHelper._();
}
