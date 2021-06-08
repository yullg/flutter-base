import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'config_manager.dart';

class DownloadManager {
  static DownloadTaskNotifier? _downloadTaskNotifier;
  static Timer? _timer;
  static bool _refreshing = false;

  static Future<void> initialize() async {
    _downloadTaskNotifier = DownloadTaskNotifier(null);
    await FlutterDownloader.initialize(debug: BaseConfig.debug ?? false);
    FlutterDownloader.registerCallback(_downloadCallback);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      refreshDownloadTask().catchError((e, s) {});
    });
  }

  static DownloadTaskNotifier get downloadTaskNotifier => _downloadTaskNotifier!;

  static Future<void> refreshDownloadTask() async {
    if (_refreshing) return;
    try {
      _refreshing = true;
      var downloadTasks = await FlutterDownloader.loadTasks();
      _downloadTaskNotifier!.value = downloadTasks;
    } finally {
      _refreshing = false;
    }
  }

  static Future<void> destroy() async {
    _timer?.cancel();
    _timer = null;
    _downloadTaskNotifier?.dispose();
    _downloadTaskNotifier = null;
  }

  DownloadManager._();
}

class DownloadTaskNotifier extends ValueNotifier<List<DownloadTask>?> {
  DownloadTaskNotifier(List<DownloadTask>? value) : super(value);
}

void _downloadCallback(String id, DownloadTaskStatus status, int progress) {
  print("$id--$status--$progress");
}
