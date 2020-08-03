import 'package:book_web/utils/keep_alive_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return keepAliveWrapper(
      Container(
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text("主页........"),
      ),
    );
  }
}
