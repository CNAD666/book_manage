import 'dart:ui';

import 'package:book_web/app/common/bg_info/bg_info.dart';
import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:book_web/module/home/home_state.dart';
import 'package:flutter/material.dart';

typedef HomeChangeBgTypeCallback = void Function(BgInfoBean bgInfoBean);
typedef HomeChangeBgCallback = void Function();
typedef HomeToLoginCallback = void Function();

///背景上的内容体
class HomeBody extends StatelessWidget {
  final HomeState state;
  final HomeChangeBgTypeCallback onBgTypeChange;
  final HomeChangeBgCallback onBgChange;
  final HomeToLoginCallback onLogin;

  HomeBody({this.state, this.onBgTypeChange, this.onBgChange, this.onLogin});

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  ///主体body模块
  Widget _body() {
    return Row(
      children: [
        ///左边区域
        Expanded(
          flex: 1,
          child: Container(),
        ),

        ///中间区域
        Expanded(
          flex: 5,
          child: _middleArea(),
        ),

        ///右边区域
        Expanded(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }

  ///中间区域
  Center _middleArea() {
    return Center(
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          children: [
            ///设置内容区域背景
            _contentBodyBg(),

            ///毛玻璃上的内容体
            Column(
              children: [
                ///第一排的功能：切换背景类型  切换背景   登陆
                _firstRowFunction(),

                ///其它内容区域
//              _otherContent(context, state),
              ],
            )
          ],
        ),
      ),
    );
  }

  ///主体内容区域的背景
  Widget _contentBodyBg() {
    return ClipRect(
      child: BackdropFilter(
        //设置图片模糊度 配套ClipRect使用，不然会造成全局模糊：BackdropFilter-毛玻璃效果
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Opacity(
          opacity: 0.5,
          child: Container(color: Colors.white),
        ),
      ),
    );
  }

  ///背景毛玻璃效果上的内容体
  Widget _firstRowFunction() {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.end,
        children: [
          ///切换页面背景类型
          Padding(
            padding: EdgeInsets.all(auto(10)),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                items: state.bgInfoList
                    .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.picName)))
                    .toList(),
                value: state.selectedBgType,
                onChanged: (value) {
                  onBgTypeChange(value);
                },
              ),
            ),
          ),

          ///切换页面背景
          Padding(
            padding: EdgeInsets.all(auto(10)),
            child: FlatButton.icon(
              onPressed: () {
                onBgChange();
              },
              label: Text("切换背景"),
              icon: Icon(Icons.bubble_chart),
            ),
          ),

          ///登录
          Padding(
            padding: EdgeInsets.all(auto(10)),
            child: FlatButton.icon(
              onPressed: () {
                onLogin();
              },
              label: Text("登录"),
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
