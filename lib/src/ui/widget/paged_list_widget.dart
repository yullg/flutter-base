import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PagedListWidget extends StatefulWidget {
  final ValueGetter<PagedListController> controllerBuilder;
  final EdgeInsetsGeometry? padding;

  PagedListWidget({Key? key, required this.controllerBuilder, this.padding}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PagedListWidgetState();
}

class _PagedListWidgetState extends State<PagedListWidget> {
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
          builder: (_, controller, child) => ListView.separated(
            padding: widget.padding,
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
  final ValueGetter<PagedListController> controllerBuilder;

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
          builder: (_, controller, child) => SliverList(
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

enum PagedListControllerStatus { idle, loading, finished, failed }

class PagedListControllerAttribute<T> {
  final List<T> _datas;
  PagedListControllerStatus _status;

  PagedListControllerAttribute([Iterable<T>? datas, PagedListControllerStatus? status])
      : _datas = [...?datas],
        _status = status ?? PagedListControllerStatus.idle;
}

abstract class PagedListController<T> extends ChangeNotifier {
  final PagedListControllerAttribute<T> _attribute;

  PagedListController({PagedListControllerAttribute<T>? attribute}) : _attribute = attribute ?? PagedListControllerAttribute<T>();

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < _attribute._datas.length) {
      return dataToWidget(context, index, _attribute._datas[index]);
    } else {
      switch (_attribute._status) {
        case PagedListControllerStatus.idle:
          _loadMoreData();
          return loadingWidgetBuilder(context);
        case PagedListControllerStatus.loading:
          return loadingWidgetBuilder(context);
        case PagedListControllerStatus.finished:
          if (_attribute._datas.isEmpty) {
            return noneWidgetBuilder(context);
          } else {
            return finishedWidgetBuilder(context);
          }
        case PagedListControllerStatus.failed:
          return failedWidgetBuilder(context);
      }
    }
  }

  Future<void> _loadMoreData() async {
    try {
      _attribute._status = PagedListControllerStatus.loading;
      List<T>? moreData = await loadMoreData(_attribute._datas.length);
      if (moreData != null) {
        _attribute._datas.addAll(moreData);
        _attribute._status = PagedListControllerStatus.idle;
      } else {
        _attribute._status = PagedListControllerStatus.finished;
      }
    } catch (e) {
      _attribute._status = PagedListControllerStatus.failed;
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
              child: CircularProgressIndicator(strokeWidth: 1, valueColor: AlwaysStoppedAnimation(Colors.grey)),
            ),
            Text("  加载中...", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );

  Widget noneWidgetBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("暂无数据", style: TextStyle(color: Colors.grey)),
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
          Container(width: 25, height: 1, color: Colors.grey),
          Text("  已加载全部  ", style: TextStyle(color: Colors.grey)),
          Container(width: 25, height: 1, color: Colors.grey),
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
          Text("加载失败 请刷新重试", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Future<List<T>?> loadMoreData(int offset);

  Widget dataToWidget(BuildContext context, int index, T data);
}
