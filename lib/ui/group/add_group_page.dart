import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/res/gaps.dart';
import 'package:flutter_pool_agent/res/styles.dart';
import 'package:flutter_pool_agent/utils/change_notifier_manage.dart';
import 'package:flutter_pool_agent/widgets/my_app_bar.dart';
import 'package:flutter_pool_agent/widgets/my_button.dart';
import 'package:flutter_pool_agent/widgets/my_dialog.dart';
import 'package:flutter_pool_agent/widgets/my_scaffold.dart';
import 'package:flutter_pool_agent/widgets/my_scroll_view.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class AddGroupPage extends StatefulWidget {
  const AddGroupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddGroupPageState();
  }
}

class _AddGroupPageState extends State<AddGroupPage> with ChangeNotifierMixin {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  bool _clickable = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: const MyAppBar(centerTitle: "新建分组"),
      body: MyScrollView(
          padding: const EdgeInsets.only(left: Dimens.dp16, right: Dimens.dp16),
          children: [
            Gaps.vGap40,
            TextField(
              focusNode: _nodeText1,
              controller: _nameController,
              style: TextStyles.main_text15,
              maxLines: 1,
              maxLength: 30,
              decoration:
                  const InputDecoration(hintText: "请输入分组名称", counterText: ""),
            ),
            const SizedBox(
              height: 160,
            ),
            MyButton(
                text: "确定",
                onPressed: _clickable
                    ? () {
                            DialogUtils.showLoading();
                      }
                    : null)
          ]),
    );
  }

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    // TODO: implement changeNotifier
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _nodeText1: null,
    };
  }

  void _verify() {
    final String name = _nameController.text;

    bool clickable = true;
    if (name.isEmpty || name.length < 4) {
      clickable = false;
    }

    /// 状态不一样再刷新，避免不必要的setState
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }
}
