import 'package:book_web/module/home/home_view.dart';
import 'package:book_web/module/setting/setting_view.dart';
import 'package:flutter/material.dart';

class MainState {
  int selectedIndex;
  bool isExtended;

  //PageView页面
  List<Widget> pageList = [
    HomePage(),
    SettingPage(),
    HomePage(),
  ];

  MainState({this.selectedIndex, this.isExtended});
}
