import 'package:flutter/widgets.dart';

@immutable
abstract class LoginEvent {}

///初始化操作
class LoginInitEvent extends LoginEvent {}

///跳转后台管理页面
class ToMainPageEvent extends LoginEvent {
  final BuildContext context;

  ToMainPageEvent(this.context);
}
