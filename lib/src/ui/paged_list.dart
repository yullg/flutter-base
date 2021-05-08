import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef PagedListControllerBuilder = PagedListController Function();

class PagedListWidget extends StatefulWidget {
  final PagedListControllerBuilder controllerBuilder;

  PagedListWidget({Key? key, required this.controllerBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PagedListWidgetState();
}

class _PagedListWidgetState extends State<PagedListWidget> {
  late PagedListController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controllerBuilder();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<PagedListController>(
          builder: (context, controller, child) => ListView.separated(
            itemCount: controller._dataBuffer._datas.length + 1,
            itemBuilder: controller._itemBuilder,
            separatorBuilder: controller.separatorWidgetBuilder,
          ),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class PagedSliverListWidget extends StatefulWidget {
  final PagedListControllerBuilder controllerBuilder;

  PagedSliverListWidget({Key? key, required this.controllerBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PagedSliverListWidgetState();
}

class _PagedSliverListWidgetState extends State<PagedSliverListWidget> {
  late final PagedListController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controllerBuilder();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<PagedListController>(
          builder: (context, controller, child) => SliverList(
            delegate: SliverChildBuilderDelegate(
              controller._itemBuilder,
              childCount: controller._dataBuffer._datas.length + 1,
            ),
          ),
        ),
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

enum _Status { idle, loading, finished, failed }

class DataBuffer<T> {
  final List<T> _datas;

  DataBuffer([Iterable<T>? datas]) : _datas = [...?datas];
}

abstract class PagedListController<T> extends ChangeNotifier {
  final DataBuffer<T> _dataBuffer;
  _Status _status = _Status.idle;

  PagedListController({DataBuffer<T>? dataBuffer}) : _dataBuffer = dataBuffer ?? DataBuffer<T>();

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < _dataBuffer._datas.length) {
      return dataToWidget(context, index, _dataBuffer._datas[index]);
    } else {
      switch (_status) {
        case _Status.idle:
          _loadMoreData();
          return loadingWidgetBuilder(context);
        case _Status.loading:
          return loadingWidgetBuilder(context);
        case _Status.finished:
          if (_dataBuffer._datas.isEmpty) {
            return noneWidgetBuilder(context);
          } else {
            return finishedWidgetBuilder(context);
          }
        case _Status.failed:
          return failedWidgetBuilder(context);
      }
    }
  }

  Future<void> _loadMoreData() async {
    try {
      _status = _Status.loading;
      List<T>? moreData = await loadMoreData(_dataBuffer._datas.length);
      if (moreData != null) {
        _dataBuffer._datas.addAll(moreData);
        _status = _Status.idle;
      } else {
        _status = _Status.finished;
      }
    } catch (e) {
      _status = _Status.failed;
    } finally {
      notifyListeners();
    }
  }

  Widget separatorWidgetBuilder(BuildContext context, int index) => SizedBox(height: 1);

  Widget loadingWidgetBuilder(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(strokeWidth: 1, valueColor: AlwaysStoppedAnimation(Colors.black38)),
            ),
            Text("  加载中...", style: TextStyle(color: Colors.black38)),
          ],
        ),
      );

  Widget noneWidgetBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("暂无数据", style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget finishedWidgetBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(width: 25, height: 1, color: Colors.black26),
          Text("  已加载全部  ", style: TextStyle(color: Colors.black38)),
          Container(width: 25, height: 1, color: Colors.black26),
        ],
      ),
    );
  }

  Widget failedWidgetBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("加载失败 请刷新重试", style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Future<List<T>?> loadMoreData(int offset);

  Widget dataToWidget(BuildContext context, int index, T data);
}