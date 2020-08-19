import 'package:book_web/app/routes/navigator_util.dart';
import 'package:book_web/views/common/bg_info/bg_info.dart';
import 'package:book_web/views/common/bg_info/impl/anime_bg_info_impl.dart';
import 'package:book_web/views/common/bg_info/impl/bing_bg_info_impl.dart';
import 'package:book_web/views/common/bg_info/impl/hd_sights_bg_info_impl.dart';
import 'package:book_web/views/common/bg_info/impl/mc_anime_bg_info_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is InitEvent) {
      //初始化操作
      yield await _init();
    } else if (event is ChangeBgEvent) {
      //切换背景
      yield _changeHDBg();
    } else if (event is StatusSwitchEvent) {
      //切换背景时,背景加载时处于不同的状态特征
      yield _switchStatus(event);
    } else if (event is SwitchBgTypeEvent) {
      //切换背景类型
      yield _switchBgTye(event);
    } else if (event is ToLoginEvent) {
      //跳转登录页面
      _toLogin(event);
    } else if (event is SwitchHideContainer) {
      yield _isHide();
    }
  }

  ///初始化操作
  Future<HomeState> _init() async{
    //初始化背景信息列表
    List<BgInfoBean> bgList = [
      //二次元动漫
      await AnimeBgInfoImpl().getBgInfo(),
      //MC动漫
      await McAnimeBgInfoImpl().getBgInfo(),
      //高清风景
      await HdSightsBgInfoImpl().getBgInfo(),
      //必应壁纸
      await BingBgInfoImpl().getBgInfo()
    ];

    return state.clone()..bgInfoList = bgList
        ..selectedBgType = bgList[0];
  }

  ///切换背景 小歪APi
  HomeState _changeHDBg() {
    String time = new DateTime.now().toIso8601String();
    return state.clone()
      ..lastBgUrl = state.selectedBgType.picUrl
      ..selectedBgType.picUrl = state.selectedBgType.picUrl + "?$time";
  }

  ///切换状态(每次背景图片状态切换都会调用该方法)
  HomeState _switchStatus(StatusSwitchEvent event) {
    return state.clone()..isLoading = event.isLoading;
  }

  ///切换背景类型
  HomeState _switchBgTye(SwitchBgTypeEvent event) {
    return state.clone()..selectedBgType = event.bgInfoBean;
  }

  ///跳转到登录
  void _toLogin(ToLoginEvent event) {
    NavigatorUtil.goLoginPage(event.context);
  }

  HomeState _isHide() {
    return state.clone()..isHide = !state.isHide;
  }
}
