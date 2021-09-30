import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import 'package:flutter_pool_agent/routers/page/index_router.dart';
import 'package:flutter_pool_agent/widgets/easy_refresh_view.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';
import 'package:flutter_pool_agent/widgets/my_app_bar.dart';
import 'package:flutter_pool_agent/widgets/my_button.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupListPage extends StatefulWidget {
  const GroupListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GroupListPageState();
  }
}

class _GroupListPageState extends State<GroupListPage> {
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: "请选择分组",
      ),
      body: EasyRefreshHelper.buildSimpleListPage(
        context,
        _count,
        _GroupItem(),
        onRefresh: _onRefresh,
        itemExtent: 52,
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.only(
              bottom: Dimens.dp60,
              top: Dimens.dp20,
              left: Dimens.dp16,
              right: Dimens.dp16),
          child: MyButton(text: "新建分组", onPressed: () {
            NavigatorUtils.push(context, IndexRouter.addGroup);
          }),
        ),
      ],
    );
  }

  Future _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _count = 5;
        });
      }
    });
  }
}

class _GroupItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: <Widget>[
        SlideAction(
          child: Semantics(
            label: '删除',
            child: const Text("删除",style: TextStyle(color: Colors.white,fontSize: Dimens.sp15),),
          ),
          color: Colours.red,
          onTap: () {

          },
        ),
      ],

    child: Container(
      padding: const EdgeInsets.only(left: Dimens.dp16,right: Dimens.dp16),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colours.line))),
      child: Row(
        children: const [
          Text(
            "全部",
            style: TextStyles.main_text15,
          ),
          Expanded(
            child: Text.rich(
                TextSpan(children: [
                  TextSpan(text: "20.56", style: TextStyles.main_text15),
                  TextSpan(text: "Th/s", style: TextStyles.sub_text15),
                ]),
                textAlign: TextAlign.center),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: "1000",
                  style:
                  TextStyle(color: Colours.green, fontSize: Dimens.sp15)),
              TextSpan(
                  text: "/",
                  style: TextStyle(
                      color: Colours.sub_text, fontSize: Dimens.sp15)),
              TextSpan(
                  text: "500",
                  style: TextStyle(color: Colours.red, fontSize: Dimens.sp15)),
            ]),
          ),
        ],
      ),
      height: 52,
    ),);
  }
}
