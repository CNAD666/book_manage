import 'package:book_web/base/base_bloc.dart';
import 'package:book_web/widget/page/main/main_bloc.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 获取注册的 bloc，必须先注册，再去查找
    return BlocProvider<MainBloc>(
          bloc: MainBloc(),
          child: BodyPage(),
    );
  }
}

class BodyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final MainBloc _bloc = BlocProvider.of<MainBloc>(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Stream version of the Counter App')),
      body: Center(
        child: StreamBuilder<int>(
            stream: _bloc.countController.stream,
            initialData: 0,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot){
              return Text('You hit me: ${snapshot.data} times');
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          _bloc.add();
        },
      ),
    );
  }

}