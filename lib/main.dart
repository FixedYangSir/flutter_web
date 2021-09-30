import 'package:flutter/material.dart';
import 'package:flutter_pool_agent/routers/not_found_page.dart';
import 'package:flutter_pool_agent/routers/routers.dart';
import 'package:flutter_pool_agent/ui/main/splash_page.dart';
import 'package:flutter_pool_agent/utils/device_utils.dart';
import 'package:flutter_pool_agent/utils/log_utils.dart';
import 'package:flutter_pool_agent/utils/theme_utils.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'provider/locale_provider.dart';
import 'provider/theme_provider.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    Log.init();
    Routes.initRoutes();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var app = MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider())
      ],
      child: Consumer2<ThemeProvider, LocaleProvider>(
        builder:
            (_, ThemeProvider provider, LocaleProvider localeProvider, __) {
          return MaterialApp(
            title: 'Flutter Demo',

            theme: provider.getTheme(),
            darkTheme: provider.getTheme(isDarkMode: true),
            themeMode: provider.getThemeMode(),
            onGenerateRoute: Routes.router.generator,
            locale: localeProvider.locale,
            home: const SplashPage(),
            builder: (BuildContext context, Widget? child) {
              /// 仅针对安卓
              if (Device.isAndroid) {
                /// 切换深色模式会触发此方法，这里设置导航栏颜色
                ThemeUtils.setSystemNavigationBar(provider.getThemeMode());
              }
              return  FlutterSmartDialog(child: child);
            },

            /// 因为使用了fluro，这里设置主要针对Web
            onUnknownRoute: (_) {
              return MaterialPageRoute<void>(
                builder: (BuildContext context) => const NotFoundPage(),
              );
            },
            restorationScopeId: 'app',
          );
        },
      ),
    );

    return

      OKToast(
          child: app,
          backgroundColor: Colors.black54,
          textPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          radius: 20.0,
          position: ToastPosition.bottom);

  }


}
