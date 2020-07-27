import 'package:fish_redux/fish_redux.dart';

class MainState implements Cloneable<MainState> {
  ///侧边导航栏被选中的index
  int selectedIndexRail = 0;
  ///是否扩展侧边空间
  bool isExtended = true;

  @override
  MainState clone() {
    return MainState()
      ..selectedIndexRail = selectedIndexRail
      ..isExtended = isExtended;
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
