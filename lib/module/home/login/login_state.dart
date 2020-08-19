
class LoginState {
  ///登录布局左边背景
  String loginBg;

  ///登录背景昨天背景的一些提示文字
  LoginTip loginTip;

  LoginState init() {
    return LoginState()
      ..loginBg = ""
      ..loginTip = new LoginTip(msg: "", subMsg: "");
  }

  LoginState clone() {
    return LoginState()
      ..loginTip = loginTip
      ..loginBg = loginBg;
  }
}

///登录模块显示的提示语
class LoginTip {
  ///一级提示语
  String msg;

  ///二级提示语
  String subMsg;

  LoginTip({this.msg, this.subMsg});
}
