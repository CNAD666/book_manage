
import 'package:book_web/module/home/home_view.dart';
import 'package:book_web/module/home/login/login_view.dart';
import 'package:book_web/module/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

/// 首页
Handler homePageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage();
  },
);

/// 登录
Handler loginPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return LoginPage();
  },
);

/// 后台主页面
Handler mainPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return MainPage();
  },
);
