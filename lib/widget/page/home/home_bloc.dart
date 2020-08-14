import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:book_web/bean/home/home_bg_bean.dart';
import 'package:book_web/http/url.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is ChangeBgEvent) {
      yield await changeBg();
    }
  }

  ///切换背景
  Future<HomeState> changeBg() async {
    String picApi = "https://img.xjh.me/random_img.php?return=json";
    Response response = await Dio().get(picApi);
    HomeBgBean homeBgBean =
    HomeBgBean().fromJson(json.decode(response.toString()));
    String picUrl = "https:" + homeBgBean.img;
    return HomeState()..homeBg = picUrl;
  }
}
