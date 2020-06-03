import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

//create by :xs
//day by2020/6/2.
//describe:路由管理
class Routers{
  static  GlobalKey<NavigatorState>  navigatorKey= GlobalKey();
  //添加路由管理的启动事件

  //启动页
  static const String splash="/";


  static void configureRouters(Router router){

    router.notFoundHandler=new Handler(handlerFunc: (BuildContext context,Map<String,List<String>>params){
      print('路由没有找到');
      return null;
    });




  }
}