import 'package:book_web/http/url.dart';
import 'package:book_web/utils/keep_alive_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.network(
            PIC_HOME_BG,
            fit: BoxFit.fill,
          ),
          body(),
        ],
      ),
    );
  }
}


Widget body() {
  return Container(
    width: 100,
    height: 100,
    color: Colors.lightBlueAccent,
  );
}
