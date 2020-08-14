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
      yield await changeHDBg(event);
    }
  }

  ///切换背景
  Future<HomeState> changeBg() async {
    String picApi = "https://img.xjh.me/random_img.php?return=json";
    Response response = await Dio().get(picApi).catchError(print);
    HomeBgBean homeBgBean =
        HomeBgBean().fromJson(json.decode(response.toString()));
    String picUrl = "https:" + homeBgBean.img;
    return HomeState()..homeBg = picUrl;
  }

  ///切换背景 小歪APi
  Future<HomeState> changeHDBg(ChangeBgEvent event) async {
    ///二次元动漫
    String picUrlOne = "https://api.ixiaowai.cn/api/api.php";

    ///mc酱动漫
    String picUrlTwo = "https://api.ixiaowai.cn/mcapi/mcapi.php";

    ///高清壁纸
    String picUrlThree = "https://api.ixiaowai.cn/gqapi/gqapi.php";
    if (event.picUrl == picUrlOne) {
      return HomeState()..homeBg = picUrlTwo;
    } else {
      return HomeState()..homeBg = picUrlOne;
    }
  }
}
