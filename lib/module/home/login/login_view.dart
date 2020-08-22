import 'package:book_web/module/home/login/widget/login_left_area.dart';
import 'package:book_web/module/home/login/widget/login_right_area.dart';
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
  return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
    return Row(
      children: [
        ///左边区域,背景图+相关文字
        Expanded(
          flex: 5,
          child: LoginLeftArea(
            state: state,
          ),
        ),

        ///右边区域,登录选择
        Expanded(
          flex: 3,
          child: LoginRightArea(
            state: state,
            onQQ: () {
              BlocProvider.of<LoginBloc>(context).add(ToMainPageEvent(context));
            },
            onWX: () {
              BlocProvider.of<LoginBloc>(context).add(ToMainPageEvent(context));
            },
          ),
        )
      ],
    );
  });
}
