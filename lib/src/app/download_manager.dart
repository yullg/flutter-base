import 'package:flutter_downloader/flutter_downloader.dart';

import 'config_manager.dart';

class DownloadManager {
  static Future<void> initialize() async {
    await FlutterDownloader.initialize(debug: BaseConfig.debug ?? false);
    FlutterDownloader.registerCallback(downloadCallback);
  }

  static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
    print("$id--$status--$progress");
  }

  static Future<void> destroy() async {}

  DownloadManager._();
}
