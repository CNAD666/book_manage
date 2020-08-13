import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
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
    changeBg();
  }

  ///切换背景
  Stream<HomeState> changeBg() async* {
    String picApi = "ttps://api.ixiaowai.cn/api/api.php";
    Response response = await Dio().get(picApi);
    String picUrl = response.toString();

    yield HomeState()..homeBg = picUrl;
  }

}
