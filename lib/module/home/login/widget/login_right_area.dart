import 'package:book_web/app/res/pic.dart';
import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:flutter/material.dart';

import '../login_state.dart';

///QQ登录点击监听
typedef LoginQQCallback = void Function();

///微信登录点击监听
typedef LoginWXCallback = void Function();

///右边区域,登录选择
class LoginRightArea extends StatelessWidget {
  final LoginState state;
  final LoginQQCallback onQQ;
  final LoginWXCallback onWX;

  LoginRightArea({this.state, this.onWX, this.onQQ});

  @override
  Widget build(BuildContext context) {
    return _loginContent();
  }

  ///右边登录布局
  Widget _loginContent() {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///表述
          Container(
            margin: EdgeInsets.only(bottom: auto(50)),
            child: Text(
              "请选择登录方式",
              style: TextStyle(fontSize: setSp(30)),
            ),
          ),

          ///登录选择
          Wrap(
            alignment: WrapAlignment.start,
            spacing: auto(30),
            runSpacing: auto(20),
            children: [
              Material(
                child: RawMaterialButton(
                  onPressed: () {
                    onQQ();
                  },
                  child: Container(
                    width: auto(80),
                    height: auto(80),
                    child: Image.asset(Pic.ICON_QQ),
                  ),
                ),
              ),
              RawMaterialButton(
                onPressed: () {
                  onWX();
                },
                child: Container(
                  width: auto(80),
                  height: auto(80),
                  child: Image.asset(Pic.ICON_WX),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
