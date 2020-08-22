import 'dart:ui';

import 'package:book_web/app/utils/ui/auto_ui.dart';
import 'package:book_web/http/pic_url.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => HomeBloc()..add(InitEvent()),
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 2.0,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ///页面整体的背景
              _pageBg(),

              ///背景上的内容体
              _body(),

              ///切换图片时的加载效果
              _loading(),
            ],
          ),
        ),
      ),
    );
  }
}

///页面背景图，存在切换状态各种不同widget的展示
Widget _pageBg() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return ExtendedImage.network(
        state.selectedBgType.picUrl,

        ///关闭默认的加载动画
        enableLoadState: false,
        loadStateChanged: (ExtendedImageState extendedState) {
          switch (extendedState.extendedImageLoadState) {
            case LoadState.loading:
              //loading状态
              context.bloc<HomeBloc>().add(StatusSwitchEvent(true));
              //loading状态加载上上次缓存照片,使背景不会消失变白;借助图片控件的缓存功能
              return ExtendedImage.network(state.lastBgUrl, fit: BoxFit.fill);
              break;
            case LoadState.completed:
              //loading结束
              context.bloc<HomeBloc>().add(StatusSwitchEvent(false));
              return ExtendedImage.network(
                state.selectedBgType.picUrl,
                fit: BoxFit.fill,
              );
              break;
            case LoadState.failed:
              //关闭loading
              context.bloc<HomeBloc>().add(StatusSwitchEvent(false));
              return Text("加载失败，请重试！");
              break;
          }
          return Image.network(PicUrl.PIC_HD_SIGHTS);
        },
      );
    },
  );
}

///主体body模块
Widget _body() {
  return Center(
    child: Container(
      width: auto(1000),
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
//              _otherContent(),
            ],
          )
        ],
      ),
    ),
  );
}

///图片切换的时候loading加载动画
Widget _loading() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return Offstage(
        offstage: state.isLoading == null ? true : !state.isLoading,
        child: Align(
          alignment: Alignment.topLeft,
          child: LinearProgressIndicator(),
        ),
      );
    },
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
  return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
                context.bloc<HomeBloc>().add(SwitchBgTypeEvent(value));
              },
            ),
          ),
        ),

        ///切换页面背景
        Padding(
          padding: EdgeInsets.all(auto(10)),
          child: FlatButton.icon(
            onPressed: () => context.bloc<HomeBloc>().add(ChangeBgEvent()),
            label: Text("切换背景"),
            icon: Icon(Icons.bubble_chart),
          ),
        ),

        ///登录
        Padding(
          padding: EdgeInsets.all(auto(10)),
          child: FlatButton.icon(
            onPressed: () =>
                context.bloc<HomeBloc>().add(ToLoginEvent(context)),
            label: Text("登录"),
            icon: Icon(Icons.person),
          ),
        ),
      ],
    );
  });
}

///测试布局内容,暂不需要
Widget _otherContent() {
  return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
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
  });
}
