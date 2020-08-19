import 'package:flutter/widgets.dart';

@immutable
abstract class LoginEvent {}

///初始化操作
class InitEvent extends LoginEvent{}