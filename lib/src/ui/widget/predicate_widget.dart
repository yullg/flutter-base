import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../permission/permission.dart';
import 'rebuild_widget.dart';

class PredicateWidget extends StatefulWidget {
  final Predicate predicate;
  final WidgetBuilder trueWidgetBuilder;
  final WidgetBuilder falseWidgetBuilder;
  final WidgetBuilder waitingWidgetBuilder;
  final ValueWidgetBuilder<Object> failedWidgetBuilder;

  const PredicateWidget({
    Key? key,
    required this.predicate,
    required this.trueWidgetBuilder,
    this.falseWidgetBuilder = _defaultFalseWidgetBuilder,
    this.waitingWidgetBuilder = _defaultWaitingWidgetBuilder,
    this.failedWidgetBuilder = _defaultFailedWidgetBuilder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PredicateState();
}

class _PredicateState extends State<PredicateWidget> {
  late final Future<bool> future;

  @override
  void initState() {
    super.initState();
    future = widget.predicate.test(context);
  }

  Widget build(BuildContext context) => FutureBuilder<bool>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return widget.waitingWidgetBuilder(context);
          } else if (snapshot.hasError) {
            return widget.failedWidgetBuilder(context, snapshot.error!, null);
          } else {
            return snapshot.requireData ? widget.trueWidgetBuilder(context) : widget.falseWidgetBuilder(context);
          }
        },
      );
}

abstract class Predicate {
  Future<bool> test(BuildContext context);
}

class PredicateImpl extends Predicate {
  final Function _function;

  PredicateImpl(Future<bool> test(BuildContext context)) : _function = test;

  @override
  Future<bool> test(BuildContext context) => _function(context);
}

class CompositePredicate extends PredicateImpl {
  CompositePredicate.any(Iterable<Predicate> predicates)
      : super((context) async {
          for (Predicate predicate in predicates) {
            if (await predicate.test(context)) {
              return true;
            }
          }
          return false;
        });

  CompositePredicate.every(Iterable<Predicate> predicates)
      : super((context) async {
          for (Predicate predicate in predicates) {
            if (!await predicate.test(context)) {
              return false;
            }
          }
          return true;
        });
}

class PermissionPredicate extends Predicate {
  final Iterable<Permission> permissions;
  final bool gotoAppSettings;

  PermissionPredicate(this.permissions, {this.gotoAppSettings = true});

  @override
  Future<bool> test(BuildContext context) => PermissionSupport.requestPermissions(context, permissions, gotoAppSettings: gotoAppSettings);
}

Widget _defaultFalseWidgetBuilder(BuildContext context) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("拒绝响应 请刷新重试", style: TextStyle(fontSize: 46.sp)),
        SizedBox(width: double.infinity, height: 10),
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

Widget _defaultWaitingWidgetBuilder(BuildContext context) => Center(child: CircularProgressIndicator());

Widget _defaultFailedWidgetBuilder(BuildContext context, Object error, Widget? child) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("加载失败 请刷新重试", style: TextStyle(fontSize: 46.sp)),
        SizedBox(width: double.infinity, height: 10),
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
