import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/widgets/my_app_bar.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: Center(
        child: Text("页面不存在"),
      ),
    );
  }
}
