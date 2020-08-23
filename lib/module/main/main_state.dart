import 'package:book_web/module/main/data_statistics/data_statistics_view.dart';
import 'package:book_web/module/main/personal/personal_view.dart';
import 'package:book_web/module/main/setting/setting_view.dart';
import 'package:flutter/material.dart';

class MainState {
  int selectedIndex;
  bool isExtended;

  ///Navigation的item信息
  List<ItemInfoBean> itemList;

  ///PageView页面
  List<Widget> pageList;

  ///初始化方法,基础变量也需要赋初值,不然会报空异常
  MainState init() {
    ///item栏目
    List<ItemInfoBean> itemList = [
      ItemInfoBean(
        title: "个人信息",
        icon: Icon(Icons.person_pin),
      ),
      ItemInfoBean(
        title: "数据统计",
        icon: Icon(Icons.description),
      ),
      ItemInfoBean(
        title: "设置",
        icon: Icon(Icons.settings),
      ),
    ];

    ///PageView页面
    List<Widget> pageList = [
      Center(child: PersonalPage()),
      Center(child: DataStatisticsPage()),
      Center(child: SettingPage()),
    ];

    return MainState()
      ..selectedIndex = 0
      ..isExtended = false
      ..itemList = itemList
      ..pageList = pageList;
  }

  ///clone方法,此方法实现参考fish_redux的clone方法
  ///也是对官方Flutter Login Tutorial这个demo中copyWith方法的一个优化
  ///Flutter Login Tutorial（https://bloclibrary.dev/#/flutterlogintutorial）
  MainState clone() {
    return MainState()
      ..selectedIndex = selectedIndex
      ..isExtended = isExtended
      ..itemList = itemList
      ..pageList = pageList;
  }
}

///Navigation控件item信息
class ItemInfoBean {
  ///标题
  String title;

  ///正常情况图标
  Icon icon;

  ItemInfoBean({this.icon, this.title});
}
