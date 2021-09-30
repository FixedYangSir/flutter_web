import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';

class ChartView extends StatelessWidget {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Gaps.hGap16,
            Text(
              "算力图表",
              style: TextStyle(
                  color: Colours.main_text,
                  fontSize: Dimens.sp16,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TimeChooseWidget(),
            Gaps.hGap16
          ],
        ),
        Gaps.vGap10,
        Row(
          children: const [
            Gaps.hGap16,
            Text(
              "算力 (H/s)",
              style: TextStyle(fontSize: Dimens.sp12, color: Colours.sub_text),
            ),
            Spacer(),
            Text(
              "拒绝率 (%)",
              style: TextStyle(fontSize: Dimens.sp12, color: Colours.sub_text),
            ),
            Gaps.hGap16,
          ],
        ),
        Gaps.vGap10,
        Container(
          margin: const EdgeInsets.only(left: Dimens.dp16,right: Dimens.dp16),
          width: double.infinity,
          height: 150,
          color: Colours.hint_text,
        ),
        Gaps.vGap16
      ],
    );
  }
}

class TimeChooseWidget extends StatefulWidget {
  const TimeChooseWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TimeChooseWidgetState();
  }
}

class _TimeChooseWidgetState extends State<TimeChooseWidget> {
  var isHour = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: Dimens.dp20,
      decoration: BoxDecoration(
          border: Border.all(color: Colours.app_main, width: 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(2))),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              if (isHour) {
                return;
              }
              setState(() {
                isHour = true;
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "1小时",
                style: TextStyle(
                  fontSize: Dimens.sp10,
                  color: isHour ? Colors.white : Colours.sub_text,
                ),
              ),
              decoration: BoxDecoration(
                  color: isHour ? Colours.app_main : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(2))),
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              if (!isHour) {
                return;
              }
              setState(() {
                isHour = false;
              });
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "1天",
                style: TextStyle(
                  fontSize: Dimens.sp10,
                  color: !isHour ? Colors.white : Colours.sub_text,
                ),
              ),
              decoration: BoxDecoration(
                  color: !isHour ? Colours.app_main : Colors.white,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(2))),
            ),
          )),
        ],
      ),
    );
  }
}
