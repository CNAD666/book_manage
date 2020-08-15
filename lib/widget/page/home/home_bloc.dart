import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:book_web/bean/home/home_bg_bean.dart';
import 'package:book_web/http/url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ChangeBgEvent) {
      yield await changeHDBg();
    } else if (event is StatusSwitchEvent) {
      yield statusSwitch(event);
    }
  }

  ///切换背景 岁月小筑(图片质量较差)
  Future<HomeState> changeBg() async {
    String picApi = "https://img.xjh.me/random_img.php?return=json";
    Response response = await Dio().get(picApi).catchError(print);
    HomeBgBean homeBgBean =
        HomeBgBean().fromJson(json.decode(response.toString()));
    String picUrl = "https:" + homeBgBean.img;
    return HomeState()..homeBg = picUrl;
  }

  ///切换背景 小歪APi
  Future<HomeState> changeHDBg() async {
    String time = new DateTime.now().toIso8601String();
    return HomeState()..homeBg = PicUrl.PIC_ANIME + "?$time";
  }

  HomeState statusSwitch(StatusSwitchEvent event) {
    return HomeState()
        ..isLoading = event.isLoading
        ..homeBg = state.homeBg;
  }
}
