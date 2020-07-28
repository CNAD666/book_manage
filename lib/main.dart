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
  final AbstractRoutes routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        ///页面管理
        //主页面
        "main": MainPage(),
      },

      ///全局状态管理
      visitor: (String path, Page<Object, dynamic> page) {
        /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
        /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
        if (page.isTypeof<GlobalBaseState>()) {
          /// 建立 AppStore 驱动 PageStore 的单向数据连接
          /// 1. 参数1 AppStore
          /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
          page.connectExtraStore<GlobalState>(GlobalStore.store,
              (Object pageState, GlobalState appState) {
            final GlobalBaseState p = pageState;
            if (p.themeColor != appState.themeColor) {
              if (pageState is Cloneable) {
                final Object copy = pageState.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pageState;
          });
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
