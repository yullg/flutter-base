import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../helper/datetime_helper.dart';
import '../../helper/toast_helper.dart';

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
      refreshDownloadTask().catchError((e, s) {
        ToastHelper.show("下载列表刷新失败");
      });
    });
    refreshDownloadTask().catchError((e, s) {
      ToastHelper.show("下载列表刷新失败");
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
            ),
            body: (downloadTasks != null && downloadTasks.isNotEmpty)
                ? ListView.separated(
                    itemBuilder: (context, index) => Container(
                          color: Colors.white,
                          child: Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(downloadTasks[index].filename ?? "***", overflow: TextOverflow.ellipsis),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  DateTimeHelper.format(DateTime.fromMillisecondsSinceEpoch(downloadTasks[index].timeCreated),
                                                          "yyyy-MM-dd HH:mm:ss") ??
                                                      "",
                                                  style: TextStyle(color: Colors.grey)),
                                              Builder(
                                                builder: (context) {
                                                  if (DownloadTaskStatus.canceled == downloadTasks[index].status) {
                                                    return Text("已取消", style: TextStyle(color: Colors.grey));
                                                  } else if (DownloadTaskStatus.complete == downloadTasks[index].status) {
                                                    return Text("已完成", style: TextStyle(color: Colors.grey));
                                                  } else if (DownloadTaskStatus.enqueued == downloadTasks[index].status) {
                                                    return Text("排队中", style: TextStyle(color: Colors.grey));
                                                  } else if (DownloadTaskStatus.paused == downloadTasks[index].status) {
                                                    return Text("已暂停", style: TextStyle(color: Colors.grey));
                                                  } else if (DownloadTaskStatus.running == downloadTasks[index].status) {
                                                    return Text("下载中", style: TextStyle(color: Colors.grey));
                                                  } else {
                                                    return Text("状态异常", style: TextStyle(color: Colors.grey));
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          LinearProgressIndicator(value: downloadTasks[index].progress / 100),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: IconButton(
                                        icon: Icon(Icons.delete_outline),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (_) => AlertDialog(
                                              title: Text("确定要删除吗？", textAlign: TextAlign.center),
                                              actions: [
                                                TextButton(
                                                  child: const Text('取消'),
                                                  style: ButtonStyle(
                                                    foregroundColor: MaterialStateProperty.all(Colors.black),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child: const Text('确定'),
                                                  style: ButtonStyle(
                                                    foregroundColor: MaterialStateProperty.all(Colors.red),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    FlutterDownloader.remove(taskId: downloadTasks[index].taskId, shouldDeleteContent: true)
                                                        .then((value) async {
                                                      await refreshDownloadTask().catchError((e, s) {
                                                        ToastHelper.show("下载列表刷新失败");
                                                      });
                                                    }).catchError((e) {
                                                      ToastHelper.show("操作失败");
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: DownloadTaskStatus.complete == downloadTasks[index].status
                                  ? () => FlutterDownloader.open(taskId: downloadTasks[index].taskId).catchError((e) {
                                        ToastHelper.show("文件无法打开");
                                      })
                                  : null,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 1),
                    itemCount: downloadTasks.length)
                : Center(child: Text("暂无下载任务", style: TextStyle(fontSize: 46.sp))),
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
    timer.cancel();
    downloadTaskNotifier.dispose();
    super.dispose();
  }
}

class DownloadTaskNotifier extends ValueNotifier<List<DownloadTask>?> {
  DownloadTaskNotifier(List<DownloadTask>? value) : super(value);
}
