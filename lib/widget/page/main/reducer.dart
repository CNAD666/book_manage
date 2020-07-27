import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<MainState> buildReducer() {
  return asReducer(
    <Object, Reducer<MainState>>{
      MainAction.switchTab: _switchTab,
      MainAction.switchExtended: _switchExtended,
    },
  );
}

MainState _switchTab(MainState state, Action action) {
  return state.clone()..selectedIndexRail = action.payload;
}

MainState _switchExtended(MainState state, Action action) {
  return state.clone()..isExtended = action.payload;
}
