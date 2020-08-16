import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_web/http/url.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ChangeBgEvent) {
      yield changeHDBg();
    } else if (event is StatusSwitchEvent) {
      yield switchStatus(event);
    } else if (event is SwitchBgTypeEvent) {
      yield switchBgTye(event);
    }
  }

  ///切换背景 小歪APi
  HomeState changeHDBg() {
    String time = new DateTime.now().toIso8601String();
    return state.clone()
      ..lastBgUrl = state.selectedBgType.url
      ..selectedBgType.url = state.selectedBgType.url + "?$time";
  }

  ///切换状态(每次背景图片状态切换都会调用该方法)
  HomeState switchStatus(StatusSwitchEvent event) {
    return state.clone()..isLoading = event.isLoading;
  }

  ///切换背景类型
  HomeState switchBgTye(SwitchBgTypeEvent event) {
    return state.clone()..selectedBgType = event.bgTypeBean;
  }
}
