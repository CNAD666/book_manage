import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    /// 初始化操作
    if (event is InitEvent) {
      yield init();
    }
  }

  ///初始化操作
  LoginState init() {
    DateFormat dateFormat = DateFormat("HH");
    String dateStr = dateFormat.format(DateTime.now());
    int a = int.parse(dateStr);

    String msg = "";
    if (a >= 0 && a <= 6) {
      msg = "深夜了，注意消息哟";
    }
    if (a > 6 && a <= 12) {
      msg = "Good Morning";
    }
    if (a > 12 && a <= 13) {
      msg = "Good Afternoon";
    }
    if (a > 13 && a <= 18) {
      msg = "下午了，努力工作";
    }
    if (a > 18 && a <= 24) {
      msg = "Good Evening";
    }

    return state.clone()
        ..loginTip.msg = msg
        ..loginTip.subMsg = "- Bing Provider";
  }
}
