import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum MainAction { action, switchTab, switchExtended}

class MainActionCreator {
  static Action onAction() {
    return const Action(MainAction.action);
  }

  ///切换侧边栏tab
  static Action switchTab(int selectedIndex) {
    return Action(MainAction.switchTab, payload: selectedIndex);
  }

  ///切换侧边空间扩展状态
  static Action switchExtended(bool isExtended) {
    return Action(MainAction.switchExtended, payload: isExtended);
  }

}
