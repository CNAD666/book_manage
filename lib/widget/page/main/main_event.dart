part of 'main_bloc.dart';

@immutable
abstract class MainEvent {
  const MainEvent();
}
///切换NavigationRail的tab
class SwitchTabEvent extends MainEvent{
  final int selectedIndex;

  const SwitchTabEvent({@required this.selectedIndex});
}
///展开NavigationRail,这个逻辑比较简单,就不用传参数了
class IsExtendEvent extends MainEvent{
  const IsExtendEvent();
}
