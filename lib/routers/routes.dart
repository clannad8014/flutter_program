import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';

class Routes{
  static String root='/';
  static String detailsPage = '/detail2';
  static String showResult = '/resultShow';
  static String show_2= '/show_2';
  static void configureRoutes(Router router){
    router.notFoundHandler= new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      }
    );

    router.define(detailsPage,handler:detailsHander);
    router.define(showResult,handler:resultHander);
    router.define(show_2,handler:Show_2Handel);
  }
  // static void configureRoutes(Router router) {
 
  //   router.notFoundHandler = new Handler(
  //       handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //     print("ROUTE WAS NOT FOUND !!!");
  //   });
  //   /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
  //   /// 我这边先不设置默认的转场动画，转场动画在下面会讲，可以在另外一个地方设置（可以看NavigatorUtil类）
  //   router.define(root, handler: splashHandler);
  //   router.define(home, handler: homeHandler);
  //   router.define(demoParams, handler: demoParamHandler);
  //   router.define(returnParams, handler: returnParamHandler);
  //   router.define(transitionDemo, handler: transitionDemoHandler);
  //   router.define(transitionCustomDemo, handler: transitionDemoHandler);
  //   router.define(transitionCupertinoDemo, handler: transitionDemoHandler);
 
  // }

}

//========================================================
  // static void configureRoutes(Router router) {
 
  //   router.notFoundHandler = new Handler(
  //       handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  //     print("ROUTE WAS NOT FOUND !!!");
  //   });
  //   /// 第一个参数是路由地址，第二个参数是页面跳转和传参，第三个参数是默认的转场动画，可以看上图
  //   /// 我这边先不设置默认的转场动画，转场动画在下面会讲，可以在另外一个地方设置（可以看NavigatorUtil类）
  //   router.define(root, handler: splashHandler);
  //   router.define(home, handler: homeHandler);
  //   router.define(demoParams, handler: demoParamHandler);
  //   router.define(returnParams, handler: returnParamHandler);
  //   router.define(transitionDemo, handler: transitionDemoHandler);
  //   router.define(transitionCustomDemo, handler: transitionDemoHandler);
  //   router.define(transitionCupertinoDemo, handler: transitionDemoHandler);
 
  // }