import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:flutter_pool_agent/widgets/easy_refresh_view.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';
import 'package:flutter_pool_agent/widgets/my_app_bar.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MessagePageState();
  }
}

class _MessagePageState extends State<MessagePage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          centerTitle: "消息",
          actionName: "全部已读",
          onPressed: () {},
        ),
        body: EasyRefreshHelper.buildSimpleListPage(
            context, _count, _MessageItem(),
            onRefresh: _onRefresh, onLoad: _onLoadMore,divider: Gaps.buildDivider(height: Dimens.dp8)));
  }

  Future _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _count = 20;
        });
      }
    });
  }

  Future _onLoadMore() async {
    await Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _count += 20;
        });
      }
    });
  }
}

class _MessageItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          Dimens.dp16, Dimens.dp12, Dimens.dp16, Dimens.dp12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Opacity(
                  opacity: 1,
                  child: Container(
                    margin: const EdgeInsets.only(
                        right: Dimens.dp8, top: Dimens.dp8),
                    height: Dimens.dp6,
                    width: Dimens.dp6,
                    decoration: BoxDecoration(
                        color: Colours.red,
                        borderRadius: BorderRadius.circular(3.0)),
                  )),
              const Expanded(
                child: Text(
                  "这里是消息正文，这里是消息正文，这里是消息正文，这里是消息正文，这里是消息正文",
                  style: TextStyles.main_text15,
                  maxLines: 2,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(Dimens.dp14, Dimens.dp4, 0, 0),
            child: Text(
              "09-02 10:30:57",
              style: TextStyles.sub_text12,
            ),
          )
        ],
      ),
    );
  }
}
