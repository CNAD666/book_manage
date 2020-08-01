part of 'main_bloc.dart';

@immutable
abstract class MainEvent {
  const MainEvent();
}

class SwitchTab extends MainEvent{
  final int selectedIndex;

  const SwitchTab({@required this.selectedIndex});
}

class IsExtend extends MainEvent{
  final bool isExtended;

  const IsExtend({@required this.isExtended});
}
