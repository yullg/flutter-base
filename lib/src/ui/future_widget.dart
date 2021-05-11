import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/toast_helper.dart';

class FutureWidget<T> extends StatefulWidget {
  final bool refreshable;
  final AsyncValueGetter<T?> asyncValueGetter;
  final ValueWidgetBuilder<T> valueWidgetBuilder;

  FutureWidget({Key? key, this.refreshable = true, required this.asyncValueGetter, required this.valueWidgetBuilder}) : super(key: key);

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
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            Widget child = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/image/load_failed.png", package: "base", width: 128),
                SizedBox(width: double.infinity, height: 5),
                Text("加载失败 请刷新重试", style: TextStyle(fontSize: 46.sp, color: Colors.grey)),
              ],
            );
            return widget.refreshable ? refreshableWidget(child) : child;
          } else if (!snapshot.hasData) {
            Widget child = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/image/load_failed.png", package: "base", width: 128),
                SizedBox(width: double.infinity, height: 5),
                Text("暂无数据 请刷新重试", style: TextStyle(fontSize: 46.sp, color: Colors.grey)),
              ],
            );
            return widget.refreshable ? refreshableWidget(child) : child;
          } else {
            Widget child = widget.valueWidgetBuilder(context, snapshot.data!, null);
            return widget.refreshable
                ? RefreshIndicator(
                    child: child,
                    onRefresh: () async {
                      future = widget.asyncValueGetter();
                      await future.catchError((e) {});
                      setState(() {});
                    },
                  )
                : child;
          }
        },
      );

  Widget refreshableWidget(Widget child) => LayoutBuilder(
        builder: (context, constraints) => RefreshIndicator(
          onRefresh: () async {
            future = widget.asyncValueGetter();
            await future.then((v) {
              setState(() {});
            }).catchError((e) {
              ToastHelper.show("刷新失败 请重试");
            });
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: constraints,
              child: child,
            ),
          ),
        ),
      );
}
