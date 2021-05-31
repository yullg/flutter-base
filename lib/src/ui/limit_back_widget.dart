import 'package:flutter/material.dart';

import '../helper/toast_helper.dart';

typedef BackCallback = Future<bool?> Function();

class LimitBackWidget extends StatefulWidget {
  final Widget child;
  final BackCallback? onBackCallback;

  LimitBackWidget({Key? key, required this.child, this.onBackCallback}) : super(key: key);

  @override
  State createState() => _LimitBackWidgetState();
}

class _LimitBackWidgetState extends State<LimitBackWidget> {
  DateTime? previousTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () async {
        bool? callbackResult = await widget.onBackCallback?.call();
        if (callbackResult != null) {
          return callbackResult;
        }
        if (Navigator.canPop(context)) {
          return true;
        }
        if (previousTime != null) {
          if (DateTime.now().difference(previousTime!) < Duration(seconds: 1)) {
            previousTime = null;
            return true;
          }
        }
        previousTime = DateTime.now();
        ToastHelper.show("再按一次将退出应用");
        return false;
      },
    );
  }
}
