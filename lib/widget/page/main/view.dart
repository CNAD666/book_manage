import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';

Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("主页面"),
    ),
  );
}
