import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';

class DownloadPage extends StatefulWidget {
  DownloadPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  late final DownloadTaskNotifier downloadTaskNotifier;
  late final Timer timer;
  bool _refreshing = false;

  @override
  void initState() {
    super.initState();
    downloadTaskNotifier = DownloadTaskNotifier(null);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      refreshDownloadTask().catchError((e, s) {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: downloadTaskNotifier,
      child: Consumer<DownloadTaskNotifier>(
        builder: (context, notifier, child) {
          List<DownloadTask>? downloadTasks = notifier.value;
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text("下载列表"),
              actions: [],
            ),
            body: (downloadTasks != null && downloadTasks.isNotEmpty)
                ? ListView.separated(
                    itemBuilder: (context, index) {
                      DownloadTask downloadTask = downloadTasks[index];
                      return Container(
                        color: Colors.white,
                        child: Text(downloadTask.taskId),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 1),
                    itemCount: downloadTasks.length)
                : Center(
                    child: Text("暂无下载任务"),
                  ),
          );
        },
      ),
    );
  }

  Future<void> refreshDownloadTask() async {
    if (_refreshing) return;
    try {
      _refreshing = true;
      var downloadTasks = await FlutterDownloader.loadTasks();
      downloadTaskNotifier.value = downloadTasks;
    } finally {
      _refreshing = false;
    }
  }

  @override
  void dispose() {
    downloadTaskNotifier.dispose();
    super.dispose();
  }
}

class DownloadTaskNotifier extends ValueNotifier<List<DownloadTask>?> {
  DownloadTaskNotifier(List<DownloadTask>? value) : super(value);
}
