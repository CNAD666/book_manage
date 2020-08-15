import 'dart:ui';

import 'package:book_web/http/url.dart';
import 'package:book_web/widget/page/home/home_bloc.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _pageBg(),
          _body(),
          _loading(),
        ],
      ),
    );
  }
}

///页面背景图
Widget _pageBg() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return ExtendedImage.network(
        state.homeBg,
        loadStateChanged: (ExtendedImageState extendedState) {
          switch (extendedState.extendedImageLoadState) {
            case LoadState.loading:
              //loading状态
              context.bloc<HomeBloc>().add(StatusSwitchEvent(true));
              return Container();
              break;
            case LoadState.completed:
              //loading结束
              context.bloc<HomeBloc>().add(StatusSwitchEvent(false));
              return ExtendedImage.network(
                state.homeBg,
                fit: BoxFit.fill,
              );
              break;
            case LoadState.failed:
              return Center(child: Text("加载失败，请重试！"));
              break;
          }
          return Image.network(PicUrl.PIC_HD_SIGHTS);
        },
      );
    },
  );
}

///图片切换的时候loading加载动画
Widget _loading() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return Offstage(
        offstage: state.isLoading == null ? true : !state.isLoading,
        child: Center(child: Image.asset("assets/images/loading.gif")),
      );
    },
  );
}

///主体body模块
Widget _body() {
  return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
    return Center(
      child: Container(
        width: 1000,
        height: double.infinity,
        alignment: Alignment.center,
        child: Stack(
          children: [
            ///设置内容区域背景
            ClipRect(
              child: BackdropFilter(
                //设置图片模糊度 配套ClipRect使用，不然会造成全局模糊：BackdropFilter-毛玻璃效果
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Opacity(
                  opacity: 0.5,
                  child: Container(color: Colors.white),
                ),
              ),
            ),

            Center(
              child: FloatingActionButton(onPressed: () {
                context.bloc<HomeBloc>().add(ChangeBgEvent());
              }),
            ),

            ///内容体
            Text("测试内容"),
          ],
        ),
      ),
    );
  });
}
