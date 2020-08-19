import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainEvent extends Equatable{
  const MainEvent();
}
///切换NavigationRail的tab
class SwitchTabEvent extends MainEvent{
  final int selectedIndex;

  const SwitchTabEvent({@required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
///展开NavigationRail,这个逻辑比较简单,就不用传参数了
class IsExtendEvent extends MainEvent{
  const IsExtendEvent();

  @override
  List<Object> get props => [];
}
