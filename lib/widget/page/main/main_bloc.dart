import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState(selectedIndex: 0, isExtended: false));

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is SwitchTabEvent) {
      yield MainState()
        ..selectedIndex = event.selectedIndex
        ..isExtended = state.isExtended;
    } else if (event is IsExtendEvent) {
      yield MainState()
        ..selectedIndex = state.selectedIndex
        ..isExtended = !state.isExtended;
    }
  }
}
