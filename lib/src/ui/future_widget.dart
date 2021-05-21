import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'rebuild_widget.dart';

class FutureWidget<T> extends StatefulWidget {
  final AsyncValueGetter<T?> asyncValueGetter;
  final ValueWidgetBuilder<T> valueWidgetBuilder;
  final WidgetBuilder waitingWidgetBuilder;
  final ValueWidgetBuilder<Object> failedWidgetBuilder;
  final WidgetBuilder noneWidgetBuilder;

  FutureWidget({
    Key? key,
    required this.asyncValueGetter,
    required this.valueWidgetBuilder,
    this.waitingWidgetBuilder = _defaultWaitingWidgetBuilder,
    this.failedWidgetBuilder = _defaultFailedWidgetBuilder,
    this.noneWidgetBuilder = _defaultNoneWidgetBuilder,
  }) : super(key: key);

  FutureWidget.future({
    Key? key,
    required Future<T?> future,
    required this.valueWidgetBuilder,
    this.waitingWidgetBuilder = _defaultWaitingWidgetBuilder,
    this.failedWidgetBuilder = _defaultFailedWidgetFutureBuilder,
    this.noneWidgetBuilder = _defaultNoneWidgetFutureBuilder,
  })  : asyncValueGetter = _FutureToFunction(future).function,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _FutureState<T>();
}

class _FutureState<T> extends State<FutureWidget<T>> {
  late Future<T?> future;

  @override
  void initState() {
    super.initState();
    future = widget.asyncValueGetter();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<T?>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return widget.waitingWidgetBuilder(context);
          } else if (snapshot.hasError) {
            return widget.failedWidgetBuilder(context, snapshot.error!, null);
          } else if (!snapshot.hasData) {
            return widget.noneWidgetBuilder(context);
          } else {
            return widget.valueWidgetBuilder(context, snapshot.data!, null);
          }
        },
      );
}

class _FutureToFunction<T> {
  final Future<T> future;

  _FutureToFunction(this.future);

  Future<T> function() => future;
}

Widget _defaultWaitingWidgetBuilder(BuildContext context) => Center(child: CircularProgressIndicator());

Widget _defaultFailedWidgetBuilder(BuildContext context, Object error, Widget? child) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("加载失败 请刷新重试", style: TextStyle(fontSize: 46.sp)),
        SizedBox(height: 10),
        ElevatedButton(
          child: Text("刷新"),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 46.sp)),
            shape: MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(25, 0, 25, 0)),
          ),
          onPressed: () {
            RebuildNotification().dispatch(context);
          },
        )
      ],
    );

Widget _defaultFailedWidgetFutureBuilder(BuildContext context, Object error, Widget? child) => Center(
      child: Text("加载失败", style: TextStyle(fontSize: 46.sp)),
    );

Widget _defaultNoneWidgetBuilder(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("暂无数据 请刷新重试", style: TextStyle(fontSize: 46.sp)),
        SizedBox(height: 10),
        ElevatedButton(
          child: Text("刷新"),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 46.sp)),
            shape: MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(25, 0, 25, 0)),
          ),
          onPressed: () {
            RebuildNotification().dispatch(context);
          },
        )
      ],
    );

Widget _defaultNoneWidgetFutureBuilder(BuildContext context) => Center(
      child: Text("暂无数据", style: TextStyle(fontSize: 46.sp)),
    );
