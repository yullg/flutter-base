import 'dart:async';

import 'package:flutter_downloader/flutter_downloader.dart';

import 'config_manager.dart';

class DownloadManager {
  static Future<void> initialize() async {
    await FlutterDownloader.initialize(debug: Config.debug ?? false);
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  static Future<void> destroy() async {}

  DownloadManager._();
}

void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //print("$id--$status--$progress");
}
