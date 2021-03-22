import 'package:flutter/material.dart';

import '../helper/toast_helper.dart';

class LimitBackWidget extends StatefulWidget {
  final Widget child;
  final WillPopCallback? onWillPop;

  LimitBackWidget({Key? key, required this.child, this.onWillPop}) : super(key: key);

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
        if (widget.onWillPop != null) {
          bool? result = await widget.onWillPop!();
          if (result != null) {
            return result;
          }
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
