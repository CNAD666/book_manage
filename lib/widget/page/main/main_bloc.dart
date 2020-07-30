import 'dart:async';

import 'package:book_web/base/base_bloc.dart';

class MainBloc extends BaseBloc {
  int _count = 0;

  // stream
  StreamController<int> countController = StreamController<int>();

  // 用于通知修改值
  void add() {
    countController.sink.add(_count++);
  }

  @override
  void dispose() {
    countController.close(); // 注销资源
  }
}
