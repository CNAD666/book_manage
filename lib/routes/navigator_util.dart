import 'package:flutter/material.dart';

import './application.dart';
import 'routes.dart';

class NavigatorUtil {
  /// 返回上级页面
  static void goBack(BuildContext context) {
    Navigator.pop(context);
    Application.router.pop(context);
  }

  /// 跳转到登录页面
  static void goLoginPage(BuildContext context) {
    /// Routes.home 路由地址
    /// replace：true 将上级页面给替换掉了，这点后退键的时候就不会再出现上级页面  false：就是不替换
    Application.router.navigateTo(context, Routes.login, replace: false);
  }
}
