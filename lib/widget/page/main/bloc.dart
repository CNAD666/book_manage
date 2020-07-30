import 'dart:async';

import 'package:book_web/base/base_bloc.dart';

class MainBloc extends BaseBloc {
  int _count = 0;
  bool isExtended = false;

  // stream
  StreamController<int> countController = StreamController<int>();
  StreamController<int> selectController = StreamController<int>();

  // 用于通知修改值
  void add() {
    countController.sink.add(_count++);
  }

  void switchTab(int index) {
    selectController.sink.add(index);
  }

  @override
  void dispose() {
    countController.close(); // 注销资源
    selectController.close(); // 注销资源
  }
}
