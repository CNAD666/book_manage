import 'package:book_web/widget/page/main/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

MainState _state;
Dispatch _dispatch;

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  _state = state;
  _dispatch = dispatch;

  return Scaffold(appBar: AppBar(title: Text("主页面")), body: totalPage());
}

//构建总体页面
Widget totalPage() {
  return Row(
    children: [
      //侧边栏
      navigationRailSide(),
      //分割线
      VerticalDivider(thickness: 1, width: 1),
      //Expanded占满剩下的空间
      Expanded(
        child: Center(
          child: Text("selectedIndex:" + _state.selectedIndexRail.toString()),
        ),
      )
    ],
  );
}

//增加NavigationRail组件为侧边栏
Widget navigationRailSide() {
  return NavigationRail(
    extended: _state.isExtended,
    labelType: _state.isExtended
        ? NavigationRailLabelType.none
        : NavigationRailLabelType.selected,
    destinations: [
      NavigationRailDestination(
          icon: Icon(Icons.add_to_queue),
          selectedIcon: Icon(Icons.add_to_photos),
          label: Text("测试一")),
      NavigationRailDestination(
          icon: Icon(Icons.add_circle_outline),
          selectedIcon: Icon(Icons.add_circle),
          label: Text("测试二"))
    ],
    selectedIndex: _state.selectedIndexRail,
    onDestinationSelected: (int index) {
      _dispatch(MainActionCreator.switchTab(index));

      if (index == 0) {
        _dispatch(MainActionCreator.switchExtended(true));
      } else {
        _dispatch(MainActionCreator.switchExtended(false));
      }
    },
  );
}
