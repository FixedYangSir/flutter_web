import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/res/constant.dart';
import 'package:flutter_pool_agent/routers/fluro_navigator.dart';
import 'package:flutter_pool_agent/utils/device_utils.dart';
import '../../routers/page/login_router.dart';
import 'package:flutter_pool_agent/utils/image_utils.dart';
import 'package:flutter_pool_agent/utils/log_utils.dart';
import 'package:flutter_pool_agent/widgets/load_image.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:rxdart/src/transformers/delay.dart';
import 'package:sp_util/sp_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  var _state = 0;
  final _list = ["ic_guide_b", "ic_guide_c", "ic_guide_d"];
  StreamSubscription? _streamSubscription;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await SpUtil.getInstance();
      await Device.initDeviceInfo();

      if (SpUtil.getBool(Constant.keyGuide, defValue: true)!) {
        void _preCacheImage(String img) {
          precacheImage(ImageUtils.getAssetImage(img), context);
        }

        _list.forEach(_preCacheImage);
      }
    });
    _initSplash();
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  void _initSplash() {
    _streamSubscription ??
        Stream.value(1).delay(const Duration(milliseconds: 1500)).listen((_) {
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)!) {
        SpUtil.putBool(Constant.keyGuide, false);
        setState(() {
          _state = 1;
        });
      } else {
         _goLogin();
    }
    });


  }

  void _goLogin(){
    NavigatorUtils.push(context, LoginRouter.loginPage,replace: true);
  }

  @override
  Widget build(BuildContext context) {



    // TODO: implement build
    return Material(

      child: _state == 0
          ? const Center(
              child: LoadAssetImage("ic_launcher_round",
                  width: 50, height: 50, fit: BoxFit.contain),
            )
          : Swiper(
              loop: false,
              itemBuilder: (context, index) {
                return LoadAssetImage(
                  _list[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                );
              },
              onTap: (index){
                if(index==_list.length-1){
                     _goLogin();
                }
              },
              itemCount: _list.length),
    );
  }
}
