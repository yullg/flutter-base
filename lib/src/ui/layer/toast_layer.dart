import 'package:fluttertoast/fluttertoast.dart';

class ToastLayer {
  static void show(String text, {bool durable = false}) {
    Fluttertoast.showToast(msg: text, toastLength: durable ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT);
  }

  static void close() {
    Fluttertoast.cancel();
  }

  ToastLayer._();
}
