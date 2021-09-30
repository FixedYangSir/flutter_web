import 'dart:ui';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/constant.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:keyboard_actions/keyboard_actions.dart';


class Utils {


  static KeyboardActionsConfig getKeyboardActionsConfig(BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: ThemeUtils.getKeyboardActionsColor(context),
      nextFocus: true,
      actions: List.generate(list.length, (i) => KeyboardActionsItem(
        focusNode: list[i],
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(getCurrLocale() == 'zh' ? '关闭' : 'Close'),
              ),
            );
          },
        ],
      )),
    );
  }

  static String? getCurrLocale() {
    final String locale = SpUtil.getString(Constant.locale)!;
    if (locale == '') {
      return window.locale.languageCode;
    }
    return locale;
  }

}


/// String 空安全处理
extension StringExtension on String? {
  String get nullSafe => this ?? '';
}