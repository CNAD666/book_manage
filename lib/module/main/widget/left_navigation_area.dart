import 'package:flutter/material.dart';

import '../main_state.dart';

///控制展开侧边栏监听
typedef MainExtendCallback = void Function();

///侧边栏item点击监听
typedef MainNavigationItemCallback = void Function(int index);

///NavigationRail组件为侧边栏
class LeftNavigationArea extends StatelessWidget {
  final MainState state;
  final MainExtendCallback onExtend;
  final MainNavigationItemCallback onItem;

  LeftNavigationArea({this.state, this.onExtend, this.onItem});

  @override
  Widget build(BuildContext context) {
    return _navigationRailSide();
  }

  //增加NavigationRail组件为侧边栏
  Widget _navigationRailSide() {
    //顶部widget
    Widget topWidget = Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 80,
            height: 80,
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
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              child: Container(color: Colors.deepOrange,),
            ),
          ],
        ),
      ),
    );

    return NavigationRail(
      backgroundColor: Colors.white12,
      //阴影Z轴高度
      elevation: 3,
      extended: state.isExtended,
      labelType: state.isExtended
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.selected,
      //侧边栏中的item
      destinations: state.itemList.map((item) {
        return NavigationRailDestination(
          icon: item.icon,
          label: Text(item.title),
        );
      }).toList(),
      //顶部widget
      leading: topWidget,
//    //底部widget
      trailing: bottomWidget,
      selectedIndex: state.selectedIndex,
      onDestinationSelected: (int index) {
        onItem(index);
      },
    );
  }
}
