part of 'home_bloc.dart';

@immutable
abstract class HomeEvent{
  const HomeEvent();
}

///更换被背景图
class ChangeBgEvent extends HomeEvent{
  ChangeBgEvent();
}

///状态切换
class StatusSwitchEvent extends HomeEvent{
  final bool isLoading;

  StatusSwitchEvent(this.isLoading);
}