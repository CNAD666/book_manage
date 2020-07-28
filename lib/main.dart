import 'package:book_web/store/state.dart';
import 'package:book_web/store/store.dart';
import 'package:book_web/widget/page/main/page.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(createApp());
}

Widget createApp() {
  /// globalUpdate
  globalUpdate() => (Object pageState, GlobalState appState) {
    final GlobalBaseState p = pageState;

    if (pageState is Cloneable) {
      final Object copy = pageState.clone();
      final GlobalBaseState newState = copy;

      // pageState 属性和 appState 属性不相同，则把 appState 对应的属性赋值给 newState
      if (p.themeColor != appState.themeColor) {
        newState.themeColor = appState.themeColor;
      }

      return newState; // 返回新的 state 并将数据设置到 ui
    }

    return pageState;
  };

  final AbstractRoutes routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        ///页面管理
        //主页面
        "main": MainPage(),
      },

      ///全局状态管理
      visitor: (String path, Page<Object, dynamic> page) {
        if (page.isTypeof<GlobalBaseState>()) {
          // connectExtraStore 方法将 page store 和 app store 连接起来
          // globalUpdate() 就是具体的实现逻辑
          page.connectExtraStore<GlobalState>(
              GlobalStore.store, globalUpdate());
        }
      });



  return MaterialApp(
    title: 'Flutter Book Backstage',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    //作为默认页面
    home: routes.buildPage("main", null),
    //切换页面效果设置
    onGenerateRoute: (RouteSettings settings) {
      //ios页面切换风格
      return CupertinoPageRoute(builder: (BuildContext context) {
        autoUi(context); //界面适配
        return routes.buildPage(settings.name, settings.arguments);
      });

      //Material页面切换风格
//      return MaterialPageRoute<Object>(builder: (BuildContext context) {
//        autoUi(context);  //界面适配
//        return routes.buildPage(settings.name, settings.arguments);
//      });
    },
  );
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
