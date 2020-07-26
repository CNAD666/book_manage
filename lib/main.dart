

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(createApp());
}

Widget createApp() {
  return MaterialApp(
    title: 'FishDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Scaffold(
      appBar: AppBar(title: Text("Book后台管理Web"),),
      body: InkWell(
        child: FloatingActionButton(),
        onTap: getUserInfo,
      ),
    )
  );
}

void getUserInfo() async{
  var userInfo = await Dio().get("http://localhost:8080/user/queryUserInfo");
  print(userInfo.data);
}