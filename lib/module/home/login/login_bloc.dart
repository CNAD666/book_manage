import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_web/http/url.dart';
import 'package:book_web/views/module/bg/bg_info.dart';
import 'package:book_web/views/module/bg/impl/bing_bg_info_impl.dart';
import 'package:intl/intl.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState().init());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    /// 初始化操作
    if (event is InitEvent) {
      yield await init();
    }
  }

  ///初始化操作
  Future<LoginState> init() async{
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

    BgInfo bgInfo = BingBgInfoImpl();
    BgInfoBean bgInfoBean = await bgInfo.getBgInfo();

    String loginBg = PicUrl.PIC_ANIME + "?${DateTime.now().toIso8601String()}";

    return state.clone()
      ..loginBg = loginBg
      ..loginTip.msg = msg
      ..loginTip.subMsg = "- Bing Provider";
  }
}
