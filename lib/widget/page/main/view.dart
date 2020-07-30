import 'dart:js';

import 'package:book_web/base/base_bloc.dart';
import 'package:book_web/utils/auto_ui.dart';
import 'package:book_web/widget/page/main/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MainBloc _bloc;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取注册的 bloc，必须先注册，再去查找
    return BodyPage();
  }
}

class BodyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _bloc = MainBloc(0);

    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: totalPage(),
    );
  }
}

Widget totalPage() {
  return Row(
    children: [
      //侧边栏
      navigationRailSide(),
      //Expanded占满剩下的空间
      Expanded(
          child: Center(
        child: BlocBuilder<MainBloc, int>(
          builder: (context, state){
            return Text(
                  "selectedIndex:" + state.toString());
            }),
        )
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
//        _bloc.isExtended;
      },
      child: Icon(_bloc.isExtended ? Icons.send : Icons.navigation),
    ),
  );

  return BlocBuilder<MainBloc, int>(
      builder: (context, state) {
        return NavigationRail(
          backgroundColor: Colors.white12,
          //阴影Z轴高度
          elevation: 3,
          extended: _bloc.isExtended,
          labelType: _bloc.isExtended
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
          selectedIndex: state,
          onDestinationSelected: (int index) {
//            _bloc.(MainEvent.switchTab);
            if (index == 2) {
              //全局变色

            }
          },
        );
      });
}
