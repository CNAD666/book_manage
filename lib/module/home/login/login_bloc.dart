import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_web/app/routes/navigator_util.dart';
import 'package:book_web/views/common/bg_info/bg_info.dart';
import 'package:book_web/views/common/bg_info/impl/bing_bg_info_impl.dart';
import 'package:intl/intl.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState().init());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    /// 初始化操作
    if (event is LoginInitEvent) {
      yield await _init();
    } else if (event is ToMainPageEvent) {
      _toMainPage(event);
    }
  }

  ///初始化操作
  Future<LoginState> _init() async {
    DateFormat dateFormat = DateFormat("HH");
    String dateStr = dateFormat.format(DateTime.now());
    int a = int.parse(dateStr);

    String msg = "";
    if (a >= 0 && a <= 6) {
      msg = "深夜了，注意休息哟";
    } else if (a > 6 && a <= 12) {
      msg = "Good Morning";
    } else if (a > 12 && a <= 13) {
      msg = "Good Afternoon";
    } else if (a > 13 && a <= 18) {
      msg = "下午了，干劲十足，努力工作";
    } else if (a > 18 && a <= 24) {
      msg = "Good Evening";
    }

    //切换不同壁纸,切换不同实现方法即可
    BgInfo bgInfo = BingBgInfoImpl();

    BgInfoBean bgInfoBean = await bgInfo.getBgInfo();

    return state.clone()
      ..loginBg = bgInfoBean.picUrl
      ..loginTip.msg = msg
      ..loginTip.subMsg = "- ${bgInfoBean.picName}";
  }

  void _toMainPage(ToMainPageEvent event) {
    NavigatorUtil.goMainPage(event.context);
  }
}
