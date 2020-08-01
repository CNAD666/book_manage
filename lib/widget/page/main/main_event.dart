part of 'main_bloc.dart';

@immutable
abstract class MainEvent {
  const MainEvent();
}

class SwitchTabEvent extends MainEvent{
  final int selectedIndex;

  const SwitchTabEvent({@required this.selectedIndex});
}

class IsExtendEvent extends MainEvent{
  final bool isExtended;

  const IsExtendEvent({@required this.isExtended});
}
