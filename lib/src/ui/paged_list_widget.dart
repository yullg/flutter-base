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
            itemCount: controller._attribute._datas.length + 1,
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
              childCount: controller._attribute._datas.length + 1,
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

enum ControllerStatus { idle, loading, finished, failed }

class ControllerAttribute<T> {
  final List<T> _datas;
  ControllerStatus _status;

  ControllerAttribute([Iterable<T>? datas, ControllerStatus? status])
      : _datas = [...?datas],
        _status = status ?? ControllerStatus.idle;
}

abstract class PagedListController<T> extends ChangeNotifier {
  final ControllerAttribute<T> _attribute;

  PagedListController({ControllerAttribute<T>? attribute}) : _attribute = attribute ?? ControllerAttribute<T>();

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < _attribute._datas.length) {
      return dataToWidget(context, index, _attribute._datas[index]);
    } else {
      switch (_attribute._status) {
        case ControllerStatus.idle:
          _loadMoreData();
          return loadingWidgetBuilder(context);
        case ControllerStatus.loading:
          return loadingWidgetBuilder(context);
        case ControllerStatus.finished:
          if (_attribute._datas.isEmpty) {
            return noneWidgetBuilder(context);
          } else {
            return finishedWidgetBuilder(context);
          }
        case ControllerStatus.failed:
          return failedWidgetBuilder(context);
      }
    }
  }

  Future<void> _loadMoreData() async {
    try {
      _attribute._status = ControllerStatus.loading;
      List<T>? moreData = await loadMoreData(_attribute._datas.length);
      if (moreData != null) {
        _attribute._datas.addAll(moreData);
        _attribute._status = ControllerStatus.idle;
      } else {
        _attribute._status = ControllerStatus.finished;
      }
    } catch (e) {
      _attribute._status = ControllerStatus.failed;
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
