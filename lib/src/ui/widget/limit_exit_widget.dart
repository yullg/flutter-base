import 'package:flutter/material.dart';
import 'package:move_to_background/move_to_background.dart';

import '../../helper/toast_helper.dart';

typedef _ExitCallback = Future<bool?> Function();

class LimitExitWidget extends StatefulWidget {
  final Widget child;
  final _ExitCallback? onExitCallback;

  LimitExitWidget({Key? key, required this.child, this.onExitCallback}) : super(key: key);

  @override
  State createState() => _LimitExitWidgetState();
}

class _LimitExitWidgetState extends State<LimitExitWidget> {
  DateTime? previousTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () async {
        bool? callbackResult = await widget.onExitCallback?.call();
        if (callbackResult != null) {
          if (callbackResult) {
            if (Navigator.canPop(context)) {
              return true;
            } else {
              MoveToBackground.moveTaskToBack();
              return false;
            }
          } else {
            return false;
          }
        }
        if (Navigator.canPop(context)) {
          return true;
        }
        if (previousTime != null) {
          if (DateTime.now().difference(previousTime!) < Duration(seconds: 1)) {
            previousTime = null;
            MoveToBackground.moveTaskToBack();
            return false;
          }
        }
        previousTime = DateTime.now();
        ToastHelper.show("再按一次将退出应用");
        return false;
      },
    );
  }
}
