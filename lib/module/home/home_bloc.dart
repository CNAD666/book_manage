

import 'package:book_web/app/routes/navigator_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

    if (event is ChangeBgEvent) {
      //切换背景
      yield changeHDBg();
    } else if (event is StatusSwitchEvent) {
      //切换背景时,背景加载时处于不同的状态特征
      yield switchStatus(event);
    } else if (event is SwitchBgTypeEvent) {
      //切换背景类型
      yield switchBgTye(event);
    } else if (event is ToLoginEvent) {
      //跳转登录页面
      toLogin(event);
    } else if (event is SwitchHideContainer) {
      yield isHide();
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

  ///跳转到登录
  void toLogin(ToLoginEvent event) {
    NavigatorUtil.goLoginPage(event.context);
  }

  HomeState isHide() {
    return state.clone()..isHide = !state.isHide;
  }
}
