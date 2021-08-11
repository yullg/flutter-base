import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogLayer {
  static const _default_background_color = Colors.white;
  static const _default_foreground_color = Colors.black;

  static Future<T?> showLoadingDialog<T>({
    String title = "处理中...",
    Color? backgroundColor,
    Color? foregroundColor,
    Color? indicatorColor,
  }) {
    return Get.dialog<T>(
      WillPopScope(
          child: AlertDialog(
            backgroundColor: backgroundColor ?? _default_background_color,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(color: indicatorColor),
                SizedBox(width: 15),
                Text(title, style: TextStyle(color: foregroundColor ?? _default_foreground_color)),
              ],
            ),
          ),
          onWillPop: () async => false),
      barrierDismissible: false,
    );
  }

  static Future<T?> showConfirmAlertDialog<T>(
      {String? title,
      String? content,
      AlertDialogAction? cancelAction = const AlertDialogAction(name: "取消"),
      AlertDialogAction? confirmAction = const AlertDialogAction(name: "确定"),
      Color? backgroundColor,
      Color? foregroundColor,
      bool implicitClose = true,
      bool autoClose = true}) {
    if (confirmAction != null && confirmAction.color == null) {
      confirmAction = AlertDialogAction(name: confirmAction.name, color: Get.theme.accentColor, onPressed: confirmAction.onPressed);
    }
    return showAlertDialog<T>(
      title: title,
      content: content != null ? [content] : null,
      actions: [
        if (cancelAction != null) cancelAction,
        if (confirmAction != null) confirmAction,
      ],
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      implicitClose: implicitClose,
      autoClose: autoClose,
    );
  }

  static Future<T?> showAlertDialog<T>(
      {String? title,
      List<String>? content,
      List<AlertDialogAction>? actions,
      Color? backgroundColor,
      Color? foregroundColor,
      bool implicitClose = true,
      bool autoClose = true}) {
    return Get.dialog<T>(
      WillPopScope(
        child: AlertDialog(
          backgroundColor: backgroundColor ?? _default_background_color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          title:
              title != null ? Text(title, textAlign: TextAlign.center, style: TextStyle(color: foregroundColor ?? _default_foreground_color)) : null,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...?content?.map((e) => Text(e, style: TextStyle(color: foregroundColor ?? _default_foreground_color))),
              if (actions != null && actions.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: content != null && content.isNotEmpty ? 20 : 0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      ...actions.map((e) => TextButton(
                            child: Text(e.name),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(e.color ?? foregroundColor ?? _default_foreground_color),
                              shape: MaterialStateProperty.all(
                                  StadiumBorder(side: BorderSide(color: e.color ?? foregroundColor ?? _default_foreground_color))),
                              padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10)),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              if (autoClose) close();
                              e.onPressed?.call();
                            },
                          ))
                    ],
                  ),
                ),
            ],
          ),
        ),
        onWillPop: () async => implicitClose,
      ),
      barrierDismissible: implicitClose,
    );
  }

  static void close() {
    navigator?.popUntil((route) => !(Get.isDialogOpen ?? false));
  }

  DialogLayer._();
}

class AlertDialogAction {
  final String name;
  final Color? color;
  final VoidCallback? onPressed;

  const AlertDialogAction({required this.name, this.color, this.onPressed});
}
