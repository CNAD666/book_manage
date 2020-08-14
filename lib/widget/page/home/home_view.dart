import 'package:book_web/http/url.dart';
import 'package:book_web/widget/page/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _pageBg(),
          _body(),
        ],
      ),
    );
  }
}

///页面背景图
Widget _pageBg() {
  return BlocBuilder<HomeBloc, HomeState>(
    builder: (context, state) {
      return Image.network(
        state.homeBg,
        fit: BoxFit.fill,
      );
    },
  );
}

///主体body模块
Widget _body() {
  return BlocBuilder<HomeBloc, HomeState>(builder: (context, state){
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 1000,
        height: 500,
        color: Color(0x1F000000),
        child: Center(
          child: FloatingActionButton(onPressed: () {
            context.bloc<HomeBloc>().add(ChangeBgEvent());
          }),
        ),
      ),
    );
  });
}
