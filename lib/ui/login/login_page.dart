import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import 'package:flutter_pool_agent/routers/routers.dart';
import 'package:flutter_pool_agent/utils/change_notifier_manage.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:flutter_pool_agent/utils/toast_utils.dart';
import 'package:flutter_pool_agent/widgets/my_button.dart';
import 'package:flutter_pool_agent/widgets/my_scroll_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> with AutomaticKeepAliveClientMixin{
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MyScrollView(
          tapOutsideToDismiss: true,
          padding: const EdgeInsets.only(left: 24, top: 96, right: 24),
          children: [
            Text(
              "欢迎登录",
              style: TextStyles.main_text15
                  .copyWith(fontWeight: FontWeight.bold, fontSize: Dimens.sp22),
            ),
            Gaps.vGap6,
            const Text(
              "直接账号密码登录，无需注册",
              style: TextStyles.sub_text12,
            ),
            Gaps.vGap60,
            TextField(
              focusNode: _nodeText1,
              controller: _nameController,
              style: TextStyles.main_text15,
              maxLines: 1,
              maxLength: 30,
              decoration:
                  const InputDecoration(hintText: "请输入用户名", counterText: ""),
            ),
            Gaps.vGap16,
            TextField(
              obscureText: true,
              focusNode: _nodeText2,
              controller: _passwordController,
              style: TextStyles.main_text15,
              maxLines: 1,
              maxLength: 30,
              decoration:
                  const InputDecoration(hintText: "请输入密码", counterText: "",),
            ),
            Gaps.vGap40,
            MyButton(
              onPressed: () {
                final String name = _nameController.text;
                final String password = _passwordController.text;

               /* if (name.isEmpty) {
                  Toast.show("请输入账户名");
                  return;
                }
                if (password.isEmpty) {
                  Toast.show("请输入密码");
                  return;
                }*/

                NavigatorUtils.push(context, Routes.home,replace: true);


              },
              text: "登录",
              textColor: Colors.white,
            )
          ],
          bottomButton: const Padding(
            padding: EdgeInsets.only(bottom: Dimens.dp48),
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "点击登录，即表示同意",
                    style: TextStyles.sub_text12),
                TextSpan(
                    text: "《隐私政策》",
                    style: TextStyles.app_text12),
                TextSpan(
                    text: "和",
                    style: TextStyles.sub_text12),
                TextSpan(
                    text: "《服务条款》",
                    style: TextStyles.app_text12)
              ],
            )),
          ),
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
