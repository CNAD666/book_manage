part of 'main_bloc.dart';

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
