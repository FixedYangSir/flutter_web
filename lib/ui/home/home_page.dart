import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/colors.dart';
import 'package:flutter_pool_agent/res/dimens.dart';
import 'package:flutter_pool_agent/ui/index/index_page.dart';
import 'package:flutter_pool_agent/ui/login/login_page.dart';
import 'package:flutter_pool_agent/ui/my/my_page.dart';
import 'package:flutter_pool_agent/utils/log_utils.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';
import 'package:flutter_pool_agent/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with RestorationMixin {
  static const double _imageSize = 25.0;
  HomeRestore homeRestore = HomeRestore(0);
  final List<String> _appBarTitles = ['首页', '矿机', '我的'];
  final PageController _pageController = PageController();
  List<BottomNavigationBarItem>? _list;
  late List<Widget> _pageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ThemeUtils.setSystemBarStyle(color: Colors.white);
    _pageList=[const IndexPage(),const LoginPage(),const MyPage()];
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    Log.d("home didChangeDependencies");
  }

  @override
  void deactivate() {
    super.deactivate();
    Log.d("home deactivate");
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => homeRestore,
        child: BaseScaffold(
          isTwiceBack: true,
          bottomNavigationBar:
              Consumer<HomeRestore>(builder: (_, provider, __) {
            return BottomNavigationBar(
              backgroundColor: context.backgroundColor,
              items: _buildBottomNavigationBarItem(),
              type: BottomNavigationBarType.fixed,
              currentIndex: provider.value,
              elevation: 5.0,
              iconSize: 21.0,
              selectedFontSize: Dimens.sp10,
              unselectedFontSize: Dimens.sp10,
              selectedItemColor: Colours.app_main,
              unselectedItemColor: Colours.sub_text,
              onTap: (index) {
                if(index==0){
                  ThemeUtils.setSystemBarStyle(color: Colors.white);
                }else{
                  ThemeUtils.setSystemBarStyle(color: Colors.black);
                }

                _pageController.jumpToPage(index);
              } ,
            );
          }),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(), // 禁止滑动
              controller: _pageController,
              onPageChanged: (int index) => homeRestore.value = index,
              children: _pageList,
            )
        ));
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      const _tabImages = [
        [
          LoadAssetImage('ic_home', width: _imageSize),
          LoadAssetImage('ic_home_select', width: _imageSize),
        ],
        [
          LoadAssetImage('ic_mine', width: _imageSize),
          LoadAssetImage('ic_mine_select', width: _imageSize),
        ],
        [
          LoadAssetImage('ic_my', width: _imageSize),
          LoadAssetImage('ic_my_select', width: _imageSize),
        ]
      ];
      _list = List.generate(_tabImages.length, (i) {
        return BottomNavigationBarItem(
          icon: _tabImages[i][0],
          activeIcon: _tabImages[i][1],
          label: _appBarTitles[i],
        );
      });
    }
    return _list!;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Log.d("home dispose");
    _pageController.dispose();
  }

  @override
// TODO: implement restorationId
  String? get restorationId => "home";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(homeRestore, "BottomNavigationBarCurrentIndex");
  }
}

class HomeRestore extends RestorableInt {
  HomeRestore(int defaultValue) : super(defaultValue);
}
