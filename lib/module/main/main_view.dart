import 'package:book_web/module/main/main_bloc.dart';
import 'package:book_web/module/main/widget/left_navigation_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      ///在MainBloc上使用add方法,添加初始化事件
      create: (BuildContext context) => MainBloc()..add(MainInitEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _body(),
      ),
    );
  }
}

///主体模块
Widget _body() {
  var _pageController = PageController();

  return BlocBuilder<MainBloc, MainState>(
    builder: (context, state) {
      return Row(
        children: [
          ///侧边栏区域
          LeftNavigationArea(
            state: state,
            onExtend: () {
              context.bloc<MainBloc>().add(IsExtendEvent());
            },
            onItem: (index) {
              context
                  .bloc<MainBloc>()
                  .add(SwitchTabEvent(selectedIndex: index));
              _pageController.jumpToPage(index);
            },
          ),

          ///Expanded占满剩下的空间
          Expanded(
            child: _mainBodyPage(_pageController, state),
          )
        ],
      );
    },
  );
}

///NavigationRail右边的区域,使用PageView,主体内容页面
Widget _mainBodyPage(PageController pageController, MainState state) {
  return PageView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: state.pageList.length,
    itemBuilder: (context, index) => state.pageList[index],
    controller: pageController,
  );
}
