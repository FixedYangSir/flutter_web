import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';

class EasyRefreshHelper {
  ///构造简单的刷新
  static EasyRefresh buildSimpleListPage(
      BuildContext context, int count, Widget itemView,
      {double? itemExtent,
      Widget? divider,
      OnRefreshCallback? onRefresh,
      OnLoadCallback? onLoad,
      String emptyText = "暂无数据",
      bool firstRefresh = true}) {
    return EasyRefresh.custom(
      emptyWidget: count == 0 ? _buildEmptyWidget(context, emptyText) : null,
      firstRefresh: firstRefresh,
      firstRefreshWidget: _buildLoadingPage(context),
      header: MaterialHeader(),
      footer: BallPulseFooter(color: Colours.app_main),
      onRefresh: onRefresh,
      onLoad: onLoad,
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return itemView;
            },
            childCount: count,
          ),
        ),
      ],
    );
  }

  static Widget _buildEmptyWidget(BuildContext context, String emptyText) {
    return Container(
      color: context.backgroundColor,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoadImage(
            "ic_no_data",
            width: 64,
            height: 64,
          ),
          Text(
            emptyText,
            style: TextStyles.sub_text14,
          )
        ],
      ),
    );
  }

  static Widget _buildLoadingPage(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colours.app_main)),
    );
  }

  static Widget _buildList(int count, Widget itemView,
      {double? itemExtent, Widget? divider}) {
    var listView = divider != null
        ? ListView.separated(
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return itemView;
            },
            separatorBuilder: (BuildContext context, int index) {
              return divider;
            },
          )
        : ListView.builder(
            itemExtent: itemExtent,
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return itemView;
            },
          );

    return listView;
  }
}
