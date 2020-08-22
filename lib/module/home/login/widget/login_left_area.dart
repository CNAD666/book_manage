import 'dart:ui';

import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../login_state.dart';

///左边区域,背景图+相关文字
class LoginLeftArea extends StatelessWidget {
  final LoginState state;

  LoginLeftArea({this.state});

  @override
  Widget build(BuildContext context) {
    return _picContent();
  }

  ///左边背景布局
  Widget _picContent() {
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
  }

  ///顶部背景条和文字内容
  Widget _bottomTipMsg() {
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
  }
}
