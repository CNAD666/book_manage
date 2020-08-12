import 'package:book_web/http/url.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _pageBg(),
        _body(),
      ],
    );
  }
}

///页面背景图
Widget _pageBg() {
  return Image.network(
    ImageUrl.PIC_HOME_BG,
    fit: BoxFit.fill,
  );
}

///主体body模块
Widget _body() {
  return Container(
    alignment: Alignment.center,
    child:Container(
      width: 1000,
      height: 500,
      color: Color(0x9FFFFFFF),
    ),
  );
}
