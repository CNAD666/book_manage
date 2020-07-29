import 'package:book_web/store/action.dart';
import 'package:book_web/store/store.dart';
import 'package:book_web/utils/auto_ui.dart';
import 'package:book_web/widget/page/main/action.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

MainState _state;
Dispatch _dispatch;

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  _state = state;
  _dispatch = dispatch;

  return Scaffold(
      appBar: AppBar(
        backgroundColor: state.themeColor,
        title: Text("Book"),
      ),
      body: totalPage());
}

//构建总体页面
Widget totalPage() {
  return Row(
    children: [
      //侧边栏
      navigationRailSide(),
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
  //顶部widget
  Widget topWidget = Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: auto(80),
          height: auto(80),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                    "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3383029432,2292503864&fm=26&gp=0.jpg"),
                fit: BoxFit.fill),
          )),
    ),
  );

  //底部widget
  Widget bottomWidget = Container(
    child: FloatingActionButton(
      onPressed: () {
        _dispatch(MainActionCreator.switchExtended(!_state.isExtended));
      },
      child: Icon(_state.isExtended ? Icons.send : Icons.navigation),
    ),
  );

  return NavigationRail(
    backgroundColor: Colors.white12,
    //阴影Z轴高度
    elevation: 3,
    extended: _state.isExtended,
    labelType: _state.isExtended
        ? NavigationRailLabelType.none
        : NavigationRailLabelType.selected,
    //侧边栏中的item
    destinations: [
      NavigationRailDestination(
          icon: Icon(Icons.add_to_queue),
          selectedIcon: Icon(Icons.add_to_photos),
          label: Text("测试一")),
      NavigationRailDestination(
          icon: Icon(Icons.add_circle_outline),
          selectedIcon: Icon(Icons.add_circle),
          label: Text("测试二")),
      NavigationRailDestination(
          icon: Icon(Icons.bubble_chart),
          selectedIcon: Icon(Icons.broken_image),
          label: Text("变色")),
    ],
    //顶部widget
    leading: topWidget,
//    //底部widget
    trailing: bottomWidget,
    selectedIndex: _state.selectedIndexRail,
    onDestinationSelected: (int index) {
      _dispatch(MainActionCreator.switchTab(index));
      if (index == 2) {
        //全局变色
        GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor());
      }
    },
  );
}
