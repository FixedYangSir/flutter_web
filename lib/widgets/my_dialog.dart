import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import 'package:flutter_pool_agent/utils/device_utils.dart';
import 'package:flutter_pool_agent/widgets/my_loading_widget.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogUtils {
  static showTipDialog(String title, String message,
      {VoidCallback? onPressed}) {
    SmartDialog.show(
      clickBgDismissTemp: true,
      widget: TipDialog(
        title: title,
        message: message,
        onPressed: onPressed,
      ),
    );
  }

  static showLoading({String message="加载中"}){

    SmartDialog.showLoading(widget: LoadingWidget(msg: message));

  }

}

class TipDialog extends StatelessWidget {
  const TipDialog(
      {Key? key, required this.title, required this.message, this.onPressed})
      : super(key: key);
  final String title;
  final String message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Widget content = Material(
      borderRadius: BorderRadius.circular(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Gaps.vGap24,
          Text(
            title,
            style: TextStyles.main_text16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          Flexible(
              child: Padding(
            padding:
                const EdgeInsets.only(left: Dimens.dp16, right: Dimens.dp16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyles.main_text15,
            ),
          )),
          const SizedBox(height: 30),
          Gaps.buildDivider(),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                })),
                onPressed: () {
                  SmartDialog.dismiss();
                },
                child: const Text(
                  "取消",
                  style: TextStyles.sub_text14,
                ),
              )),
              Expanded(
                  child: TextButton(
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.transparent;
                })),
                onPressed: () {
                  SmartDialog.dismiss();
                  onPressed?.call();
                },
                child: const Text(
                  "确定",
                  style: TextStyles.main_text15,
                ),
              )),
            ],
          ),
        ],
      ),
    );

    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      width: double.infinity,
      child: content,
    );
  }
}
