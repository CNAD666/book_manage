import 'package:flutter/material.dart';

import '../home_state.dart';

///图片切换的时候loading加载动画
class HomeLoadingAnimation extends StatelessWidget {
  final HomeState state;

  HomeLoadingAnimation({this.state});

  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: state.isLoading == null ? true : !state.isLoading,
      child: Align(
        alignment: Alignment.topLeft,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
