import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import '../../routers/page/my_router.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';
import 'package:flutter_pool_agent/widgets/my_button.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                NavigatorUtils.push(context, MyRouter.messagePage);
              },
              icon: const LoadAssetImage(
                "ic_message",
                width: Dimens.dp22,
              ))
        ],
      ),
      body: Column(
        children: [
          ListTile(
            horizontalTitleGap: Dimens.dp8,
            contentPadding: const EdgeInsets.fromLTRB(
                Dimens.dp16, 0, Dimens.dp16, Dimens.dp8),
            leading: const CircleAvatar(
              child: LoadAssetImage(
                "ic_user",
                width: Dimens.dp46,
              ),
            ),
            title: Text(
              "比特小白",
              style: TextStyles.main_text15
                  .copyWith(fontSize: Dimens.sp18, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: Dimens.dp8),
          _getMyItem("上次登录时间", "2001-10-02 10:30:57"),
          _getMyItem("上次登录IP", "192.168.0.1"),
          _getMyItem("上次登录地址", "中国 北京"),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
                Dimens.dp16, Dimens.dp20, Dimens.dp16, Dimens.dp40),
            child: MyButton(
              onPressed: () {},
              text: "退出登录",
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _getMyItem(String left, String right) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(
            Dimens.dp16, Dimens.dp20, Dimens.dp16, Dimens.dp10),
        child: Row(
          children: [
            Text(
              left,
              style: TextStyles.main_text15,
            ),
            const Spacer(),
            Text(
              right,
              style: TextStyles.sub_text15),
          ],
        ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
