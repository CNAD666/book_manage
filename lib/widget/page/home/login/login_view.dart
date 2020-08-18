import 'dart:ui';

import 'package:book_web/http/url.dart';
import 'package:book_web/utils/auto_ui.dart';
import 'package:book_web/widget/page/home/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Scaffold(
        body: _body(context),
      ),
    );
  }
}

///主体内容：该主体分左右俩部分  左边：图片背景  右边：登陆相关信息
Widget _body(BuildContext context) {
  BlocProvider.of<LoginBloc>(context).add(InitEvent());

  return Row(
    children: [
      Expanded(
        flex: 5,
        child: _leftPicContent(),
      ),
      Expanded(
        flex: 3,
        child: _rightLoginContent(),
      )
    ],
  );
}

///左边背景布局
Widget _leftPicContent() {
  return Stack(
    children: [
      //背景
      ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Image.network(
            PicUrl.PIC_ANIME + "?${DateTime.now().toIso8601String()}",
            fit: BoxFit.cover),
      ),
      //顶部背景和小提示
      Container(
        alignment: Alignment.bottomRight,
        child: Container(
          height: auto(130),
          child: _bottomTipMsg(),
        ),
      )
    ],
  );
}

///顶部背景条和文字内容
Widget _bottomTipMsg() {
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Stack(
      children: [
        ClipRect(
          //毛玻璃背景
          child: BackdropFilter(
            //设置图片模糊度 配套ClipRect使用，不然会造成全局模糊：BackdropFilter-毛玻璃效果
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Opacity(
              opacity: 0.1,
              child: Container(color: Colors.black),
            ),
          ),
        ),

        //文字信息
        Column(
          children: [
            ///上面显示文字
            Container(
              padding: EdgeInsets.only(right: auto(120), top: auto(20)),
              alignment: Alignment.topRight,
              child: Text(
                state.loginTip.msg,
                style: TextStyle(
                  fontSize: auto(50),
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            ///下方小一号的显示文字
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: auto(70), top: auto(10)),
                child: Text(
                  state.loginTip.subMsg,
                  style: TextStyle(
                    fontSize: auto(20),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ],
    );
  });
}

///右边登录布局
Widget _rightLoginContent() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      "登录布局",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: auto(30),
      ),
    ),
  );
}
