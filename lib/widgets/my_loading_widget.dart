import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/gaps.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    required this.msg,
    this.background = Colors.black54,
  }) : super(key: key);

  ///加载信息
  final String msg;

  ///loading背景色
  final Color background;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      //加载动画
      const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
       Gaps.vGap10,
      //文字
       Text(msg, style: const TextStyle(color: Colors.white)),

    ]);
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
