import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef InfiniteListControllerBuilder = InfiniteListController Function();

class InfiniteListWidget extends StatefulWidget {
  final InfiniteListControllerBuilder controllerBuilder;

  InfiniteListWidget({Key? key, required this.controllerBuilder}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InfiniteListWidgetState();
}

class _InfiniteListWidgetState extends State<InfiniteListWidget> {
  late InfiniteListController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controllerBuilder();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: controller,
        child: Consumer<InfiniteListController>(
          builder: (context, controller, child) => ListView.separated(
            itemCount: controller._dataList.length + 1,
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

enum _Status { idle, loading, finished }

abstract class InfiniteListController<T> extends ChangeNotifier {
  final List<T> _dataList = [];
  _Status _status = _Status.idle;

  Future<void> onRefresh() async {
    _dataList.clear();
    _status = _Status.idle;
    notifyListeners();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < _dataList.length) {
      return dataToWidget(context, index, _dataList[index]);
    } else {
      switch (_status) {
        case _Status.idle:
          _loadMoreData();
          return loadingWidgetBuilder(context);
        case _Status.loading:
          return loadingWidgetBuilder(context);
        case _Status.finished:
          return finishedWidgetBuilder(context);
      }
    }
  }

  Future<void> _loadMoreData() async {
    try {
      _status = _Status.loading;
      List<T>? moreData = await loadMoreData();
      if (moreData != null) {
        _dataList.addAll(moreData);
        _status = _Status.idle;
      } else {
        _status = _Status.finished;
      }
    } catch (e) {
      _status = _Status.idle;
    } finally {
      notifyListeners();
    }
  }

  Widget separatorWidgetBuilder(BuildContext context, int index) => SizedBox(height: 1);

  Widget loadingWidgetBuilder(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "加载中...",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );

  Widget finishedWidgetBuilder(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "我是有底线的",
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Future<List<T>?> loadMoreData();

  Widget dataToWidget(BuildContext context, int index, T data);
}
