import 'dart:async';
import 'package:book_web/base/base_bloc.dart';

class ThemeBloc extends BaseBloc {
  int _count = 0;
  int get count => _count;

  // stream
  StreamController<int> _countController = StreamController.broadcast();

  Stream<int> get countStream => _countController.stream; // 用于 StreamBuilder 的 stream

  void dispatch(int value) {
    _count = value;
    _countController.sink.add(_count); // 用于通知修改值
  }

  @override
  void dispose() {
    _countController.close(); // 注销资源
  }
}