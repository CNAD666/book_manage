import 'package:book_web/global/theme_bloc.dart';
import 'package:flutter/cupertino.dart' hide Page;
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'base/base_bloc.dart';
import 'widget/page/main/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 这里对创建的 bloc 类进行注册，如果说有多个 bloc 类的话，可以通过 child 进行嵌套注册即可
    // 放在最顶层，可以全局调用，当 App 关闭后，销毁所有的 Bloc 资源，
    // 也可以在路由跳转的时候进行注册，至于在哪里注册，完全看需求
    // 例如实现主题色的切换，则需要在全局定义，当切换主题色的时候全局切换
    // 又比如只有某个或者某几个特殊界面调用，那么完全可以通过在路由跳转的时候注册
    return BlocProvider(
      bloc: ThemeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
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
