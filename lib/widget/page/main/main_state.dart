part of 'main_bloc.dart';

@immutable
abstract class MainState  extends Equatable {}

class MainInitial extends MainState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}


class NavigationState extends MainEvent{
  final int selectedIndex;
  final bool isExtended;

  const NavigationState({@required this.selectedIndex, this.isExtended});
}
