part of 'login_bloc.dart';

class LoginState {
  LoginTip loginTip;

  LoginState(){
    loginTip = LoginTip(msg: "", subMsg: "");
  }


  LoginState clone() {
    return LoginState()
        ..loginTip = loginTip;
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