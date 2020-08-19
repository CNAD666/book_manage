import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_web/module/setting/setting_event.dart';
import 'package:book_web/module/setting/setting_state.dart';


class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial());

  @override
  Stream<SettingState> mapEventToState(
    SettingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
