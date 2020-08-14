part of 'home_bloc.dart';

@immutable
abstract class HomeEvent{
  const HomeEvent();
}

///更换被背景图
class ChangeBgEvent extends HomeEvent{
  final String picUrl;

  ChangeBgEvent(this.picUrl);
}