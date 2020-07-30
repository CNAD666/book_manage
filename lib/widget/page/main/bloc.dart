import 'dart:async';

import 'package:book_web/base/base_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum MainEvent { switchTab }

class MainBloc extends Bloc<MainEvent, int> {
  bool isExtended = false;

  MainBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(MainEvent event) async* {
    switch(event) {
      case MainEvent.switchTab:
        break;
    }
  }




}
