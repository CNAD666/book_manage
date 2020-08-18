import 'package:book_web/routes/application.dart';
import 'package:book_web/routes/routes.dart';
import 'package:book_web/widget/page/home/home_view.dart';
import 'package:book_web/widget/page/home/login/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/page/main/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //路由初始化代码
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}

//界面适配
void autoUi(BuildContext context) {
  //填入设计稿中设备的屏幕尺寸
  //默认 width : 1080px , height:1920px , allowFontScaling:false
//    ScreenUtil.init(context);
  //假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
//    ScreenUtil.init(context, width: 750, height: 1334);
  //设置字体大小根据系统的“字体大小”辅助选项来进行缩放,默认为false
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
  ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
}
