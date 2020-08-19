import 'package:book_web/app/utils/ui/keep_alive_page.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return keepAliveWrapper(
      Container(
        color: Colors.lightBlueAccent,
        alignment: Alignment.center,
        child: Text("设置..........."),
      ),
    );
  }
}
