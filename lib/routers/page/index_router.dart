import 'package:fluro/fluro.dart';
import 'package:flutter_pool_agent/routers/i_router.dart';
import 'package:flutter_pool_agent/ui/group/add_group_page.dart';
import 'package:flutter_pool_agent/ui/group/group_list_page.dart';
import 'package:flutter_pool_agent/ui/my/message_page.dart';



class IndexRouter implements IRouterProvider{

  static String groupList = '/groupList';
  static String addGroup = '/addGroup';

  
  @override
  void initRouter(FluroRouter router) {
    router.define(groupList, handler: Handler(handlerFunc: (_, __) => const GroupListPage()));
    router.define(addGroup, handler: Handler(handlerFunc: (_, __) => const AddGroupPage()));

  }
  
}