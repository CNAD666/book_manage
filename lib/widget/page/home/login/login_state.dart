part of 'login_bloc.dart';

class LoginState {
  String loginBg;

  LoginTip loginTip;

  ///初始化操作
  LoginState(){
    loginTip = LoginTip(msg: "", subMsg: "");
    loginBg = PicUrl.PIC_ANIME + "?${DateTime.now().toIso8601String()}";
  }


  LoginState clone() {
    return LoginState()
        ..loginTip = loginTip
        ..loginBg = loginBg;
  }
}

///登录模块显示的提示语
class LoginTip{
  ///一级提示语
  String msg;
  ///二级提示语
  String subMsg;

  LoginTip({this.msg, this.subMsg});
}