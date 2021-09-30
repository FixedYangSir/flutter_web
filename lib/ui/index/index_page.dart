import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import 'package:flutter_pool_agent/routers/page/index_router.dart';
import 'package:flutter_pool_agent/utils/log_utils.dart';
import 'package:flutter_pool_agent/widgets/chart_view.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage>
    with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Log.d("index initState");
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Log.d("index didChangeDependencies");
  }

  @override
  void dispose() {
    super.dispose();
    Log.d("index dispose");
  }
  @override
  void deactivate() {
    super.deactivate();
    Log.d("index deactivate");
  }

  @override
  void didUpdateWidget(covariant IndexPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    Log.d("index didUpdateWidget");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            color: Colours.app_main,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap50,
              GestureDetector(
                child: Row(
                  children: const [
                    Gaps.hGap16,
                    LoadImage(
                      "ic_menu",
                      width: Dimens.dp20,
                      height: Dimens.dp20,
                    ),
                    Gaps.hGap8,
                    Text(
                      "全部",
                      style:
                          TextStyle(fontSize: Dimens.sp15, color: Colors.white),
                    )
                  ],
                ),
                onTap: () {
                  NavigatorUtils.push(context, IndexRouter.groupList);


                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                      child: _buildHashRateWidget("5656.123", "Th/s", "全部")),
                  _buildVerticalDivider(56),
                  Expanded(
                      child: _buildHashRateWidget("7895.123", "Th/s", "24小时"))
                ],
              ),
              Gaps.vGap24,
              Container(
                margin: const EdgeInsets.only(
                    left: Dimens.dp16, right: Dimens.dp16),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.dp6),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colours.shadow_bg,
                          offset: Offset(3.0, 3.0),
                          blurRadius: 6.0)
                    ]),
                child: Row(
                  children: [
                    _buildNumWidget("123", Colours.main_text, "全部"),
                    _buildVerticalDivider(34, color: Colours.line),
                    _buildNumWidget("50", Colours.green, "活跃"),
                    _buildVerticalDivider(34, color: Colours.line),
                    _buildNumWidget("60", Colours.red, "非活跃"),
                  ],
                ),
              ),
              Gaps.vGap20,
              const ChartView(),
              const Divider(thickness: Dimens.dp8, color: Colours.divider),
              Gaps.vGap12,
              const Padding(
                padding: EdgeInsets.only(left: Dimens.dp16),
                child: Text(
                  "抽水统计",
                  style: TextStyle(
                      color: Colours.main_text,
                      fontSize: Dimens.sp16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Gaps.vGap10,
              _buildShrinkItem("活跃矿机数量", "123",(){
              }),
              Gaps.buildDivider(left: Dimens.dp16,right: Dimens.dp16),
              _buildShrinkItem("实时算力", "123",(){
              }),
              Gaps.buildDivider(left: Dimens.dp16,right: Dimens.dp16)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShrinkItem(String title, String num, GestureTapCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(
              Dimens.dp16, Dimens.dp14, Dimens.dp16, Dimens.dp14),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyles.main_text15,
              ),
              const Spacer(),
              Text(
                num,
                style: TextStyles.sub_text15,
              ),
              const LoadAssetImage("ic_into",
                  width: Dimens.dp16, height: Dimens.dp16),
            ],
          )),
    );
  }

  Widget _buildVerticalDivider(double height,
      {double width = 0.5, Color color = Colors.white}) {
    return Container(width: width, height: height, color: color);
  }

  Widget _buildNumWidget(String num, Color color, String type) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          num,
          style: TextStyle(color: color, fontSize: Dimens.sp15),
        ),
        Text(
          type,
          style: TextStyles.sub_text12,
        )
      ],
    ));
  }

  Widget _buildHashRateWidget(String value, String unit, String type) {
    return Column(
      children: [
        Text.rich(TextSpan(children: [
          TextSpan(
            text: value,
            style: const TextStyle(fontSize: Dimens.sp18, color: Colors.white),
          ),
          TextSpan(
              text: unit,
              style:
                  const TextStyle(fontSize: Dimens.sp14, color: Colors.white))
        ])),
        Gaps.vGap5,
        Text(
          type,
          style: const TextStyle(fontSize: Dimens.sp14, color: Colors.white),
        )
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
