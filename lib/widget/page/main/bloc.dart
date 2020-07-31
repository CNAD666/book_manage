import 'dart:async';

import 'package:book_web/base/base_bloc.dart';
import 'package:book_web/widget/page/main/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MainEvent { switchTab }

class MainBloc extends Bloc<MainEvent, MainState> {
  bool isExtended = false;

  MainBloc() : super(MainState());

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    switch(event) {
      case MainEvent.switchTab:
        int index = state.selectIndex;
        state.selectIndex = index + 1;
        yield state;
        break;
    }
  }




}
