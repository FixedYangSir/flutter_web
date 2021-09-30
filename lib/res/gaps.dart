import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pool_agent/res/dimens.dart';

import 'colors.dart';

/// 间隔
/// 官方做法：https://github.com/flutter/flutter/pull/54394
class Gaps {
  Gaps._();

  /// 水平间隔
  static const Widget hGap4 = SizedBox(width: Dimens.dp4);
  static const Widget hGap5 = SizedBox(width: Dimens.dp5);
  static const Widget hGap6 = SizedBox(width: Dimens.dp6);
  static const Widget hGap8 = SizedBox(width: Dimens.dp8);
  static const Widget hGap10 = SizedBox(width: Dimens.dp10);
  static const Widget hGap12 = SizedBox(width: Dimens.dp12);
  static const Widget hGap15 = SizedBox(width: Dimens.dp15);
  static const Widget hGap16 = SizedBox(width: Dimens.dp16);
  static const Widget hGap32 = SizedBox(width: Dimens.dp32);

  /// 垂直间隔
  static const Widget vGap4 = SizedBox(height: Dimens.dp4);
  static const Widget vGap5 = SizedBox(height: Dimens.dp5);
  static const Widget vGap6 = SizedBox(height: Dimens.dp6);
  static const Widget vGap8 = SizedBox(height: Dimens.dp8);
  static const Widget vGap10 = SizedBox(height: Dimens.dp10);
  static const Widget vGap12 = SizedBox(height: Dimens.dp12);
  static const Widget vGap15 = SizedBox(height: Dimens.dp15);
  static const Widget vGap16 = SizedBox(height: Dimens.dp16);
  static const Widget vGap20 = SizedBox(height: Dimens.dp20);
  static const Widget vGap24 = SizedBox(height: Dimens.dp24);
  static const Widget vGap32 = SizedBox(height: Dimens.dp32);
  static const Widget vGap40 = SizedBox(height: Dimens.dp40);
  static const Widget vGap50 = SizedBox(height: Dimens.dp50);
  static const Widget vGap56 = SizedBox(height: Dimens.dp56);
  static const Widget vGap60 = SizedBox(height: Dimens.dp60);

  static Widget buildDivider(
      {Color color = Colours.line,
      double height = 0.5,
      double left = 0,
      double right = 0}) {
    return Container(
      color: color,
      width: double.infinity,
      height: height,
      margin: EdgeInsets.only(left: left, right: right),
    );
  }



  static const Widget empty = SizedBox.shrink();

  /// 补充一种空Widget实现 https://github.com/letsar/nil
  /// https://github.com/flutter/flutter/issues/78159
}
