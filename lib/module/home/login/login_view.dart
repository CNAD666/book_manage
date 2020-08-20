import 'dart:ui';

import 'package:book_web/app/res/pic.dart';
import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc()..add(InitEvent()),
      child: Scaffold(
        body: _body(),
      ),
    );
  }
}

///主体内容：该主体分左右俩部分  左边：图片背景  右边：登陆相关信息
Widget _body() {
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
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Stack(
      children: [
        //背景
        ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: ExtendedImage.network(state.loginBg,
              enableLoadState: true, fit: BoxFit.cover),
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
  });
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
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///表述
          Container(
            margin: EdgeInsets.only(bottom: auto(50)),
            child: Text("请选择登录方式"),
          ),

          ///登录选择
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                color: Colors.lightBlue,
                child: InkWell(
                  borderRadius: BorderRadius.circular(auto(40)),
                  onTap: () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(ToMainPageEvent(context));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(auto(40)),
                    child: Container(
                      width: auto(80),
                      height: auto(80),
                      child: Image.asset(Pic.ICON_QQ),
                    ),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(right: auto(30))),
              InkWell(
                borderRadius: BorderRadius.circular(auto(40)),
                onTap: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(ToMainPageEvent(context));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(auto(40)),
                  child: Container(
                    width: auto(80),
                    height: auto(80),
                    child: Image.asset(Pic.ICON_WX),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  });
}
