import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart' hide Page, Router;

import 'app/routes/application.dart';
import 'app/routes/routes.dart';
import 'module/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //路由初始化代码
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}
