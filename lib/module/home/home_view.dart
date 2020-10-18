import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:book_web/module/home/widget/home_bg.dart';
import 'package:book_web/module/home/widget/home_body.dart';
import 'package:book_web/module/home/widget/home_loding_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(InitEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: _body),
    );
  }
}

Widget _body(BuildContext context, HomeState state) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        ///页面整体的背景
        HomeBg(
          state: state,
          onLoading: () {
            context.bloc<HomeBloc>().add(StatusSwitchEvent(true));
          },
          onComplete: () {
            context.bloc<HomeBloc>().add(StatusSwitchEvent(false));
          },
          onFail: () {
            context.bloc<HomeBloc>().add(StatusSwitchEvent(false));
          },
        ),

        ///背景上的内容体
        HomeBody(
          state: state,
          onBgTypeChange: (value) {
            context.bloc<HomeBloc>().add(SwitchBgTypeEvent(value));
          },
          onBgChange: () {
            context.bloc<HomeBloc>().add(ChangeBgEvent());
          },
          onLogin: () {
            context.bloc<HomeBloc>().add(ToLoginEvent(context));
          },
        ),

        ///切换图片时的加载效果
        HomeLoadingAnimation(
          state: state,
        )
      ],
    ),
  );
}

///测试布局内容,暂不需要
Widget _otherContent(BuildContext context, HomeState state) {
  return Column(children: [
    ///切换按钮
    Container(
      padding: EdgeInsets.only(bottom: auto(10)),
      child: FloatingActionButton(
        onPressed: () => context.bloc<HomeBloc>().add(SwitchHideContainer()),
        child: Text("切换"),
      ),
    ),

    ///布局模块
    AnimatedCrossFade(
      firstChild: Container(),
      secondChild: Container(
        height: 100,
        color: Colors.deepOrange,
      ),
      crossFadeState:
          state.isHide ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 5000),
    ),

    ///下方布局
    Container(
      height: 100,
      color: Colors.blueAccent,
    ),
  ]);
}
