import 'package:fluro/fluro.dart';
import 'package:flutter_pool_agent/routers/i_router.dart';
import 'package:flutter_pool_agent/ui/my/message_page.dart';



class MyRouter implements IRouterProvider{

  static String messagePage = '/message';

  
  @override
  void initRouter(FluroRouter router) {
    router.define(messagePage, handler: Handler(handlerFunc: (_, __) => const MessagePage()));

  }
  
}