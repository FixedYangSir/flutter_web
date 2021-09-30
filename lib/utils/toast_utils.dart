import 'package:oktoast/oktoast.dart';

/// Toast工具类
class Toast {
  Toast._();

  static void show(String? msg, {int duration = 1500}) {
    if (msg == null) {
      return;
    }
    showToast(msg,
        duration: Duration(milliseconds: duration), dismissOtherToast: true);
  }

  static void cancelToast() {
    dismissAllToast();
  }
}
