import 'package:book_web/widget/page/main/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;

void main() {
  runApp(createApp());
}

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      //主页面
      "main": MainPage(),
    },
  );

  return MaterialApp(
    title: 'Book Backstage',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    //作为默认页面
    home: routes.buildPage("main", null),
    //切换页面效果设置
    onGenerateRoute: (RouteSettings settings) {
      //ios页面切换风格
      return CupertinoPageRoute(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });

      //Material页面切换风格
//      return MaterialPageRoute<Object>(builder: (BuildContext context) {
//        uiAdapter(context);  //界面适配
//        return routes.buildPage(settings.name, settings.arguments);
//      });
    },
  );
}
