import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.amberAccent,
            ),
            Center(
              child: Expanded(
                child: Container(
                  color: Colors.lightBlue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
