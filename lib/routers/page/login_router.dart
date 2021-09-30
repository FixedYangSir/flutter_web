import 'package:fluro/fluro.dart';
import 'package:flutter_pool_agent/routers/i_router.dart';
import 'package:flutter_pool_agent/ui/login/login_page.dart';



class LoginRouter implements IRouterProvider{

  static String loginPage = '/login';

  
  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, __) => const LoginPage()));

  }
  
}