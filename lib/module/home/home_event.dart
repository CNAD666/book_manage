import 'package:book_web/views/common/bg_info/bg_info.dart';
import 'package:flutter/material.dart';
import 'home_state.dart';

@immutable
abstract class HomeEvent {
}

class InitEvent extends HomeEvent {
}

///更换被背景图
class ChangeBgEvent extends HomeEvent {
  ChangeBgEvent();
}

///状态切换
class StatusSwitchEvent extends HomeEvent {
  final bool isLoading;

  StatusSwitchEvent(this.isLoading);
}

///跳转登录页面
class ToLoginEvent extends HomeEvent {
  final BuildContext context;

  ToLoginEvent(this.context);
}

///切换背景类型
class SwitchBgTypeEvent extends HomeEvent {
  final BgInfoBean bgInfoBean;

  SwitchBgTypeEvent(this.bgInfoBean);
}


///切换隐藏控件
class SwitchHideContainer extends HomeEvent {
  SwitchHideContainer();
}

