import 'dart:async';

import 'package:flutter_downloader/flutter_downloader.dart';

import 'base_config.dart';

class DownloadManager {
  static Future<void> initialize() async {
    await FlutterDownloader.initialize(debug: BaseConfig.debug ?? false);
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  static Future<void> destroy() async {}

  DownloadManager._();
}

void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
  //print("$id--$status--$progress");
}
