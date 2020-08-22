import 'package:book_web/http/pic_url.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../home_state.dart';

///加载状态
typedef HomeLoadingCallback = void Function();

///加载完成
typedef HomeLoadCompleteCallback = void Function();

///加载失败
typedef HomeLoadFailCallback = void Function();

///页面整体的背景
class HomeBg extends StatelessWidget {
  final HomeState state;
  final HomeLoadingCallback onLoading;
  final HomeLoadCompleteCallback onComplete;
  final HomeLoadFailCallback onFail;

  HomeBg({this.state, this.onComplete, this.onFail, this.onLoading});

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      state.selectedBgType.picUrl,

      ///关闭默认的加载动画
      enableLoadState: false,
      loadStateChanged: (ExtendedImageState extendedState) {
        switch (extendedState.extendedImageLoadState) {
          case LoadState.loading:
            //loading状态
            onLoading();
            //loading状态加载上上次缓存照片,使背景不会消失变白;借助图片控件的缓存功能
            return ExtendedImage.network(state.lastBgUrl, fit: BoxFit.fill);
            break;
          case LoadState.completed:
            //loading结束
            onComplete();
            return ExtendedImage.network(
              state.selectedBgType.picUrl,
              fit: BoxFit.fill,
            );
            break;
          case LoadState.failed:
            //关闭loading
            onFail();
            return Text("加载失败，请重试！");
            break;
        }
        return Image.network(PicUrl.PIC_HD_SIGHTS);
      },
    );
  }
}
