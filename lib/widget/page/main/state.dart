import 'package:fish_redux/fish_redux.dart';

class MainState implements Cloneable<MainState> {

  @override
  MainState clone() {
    return MainState();
  }
}

MainState initState(Map<String, dynamic> args) {
  return MainState();
}
