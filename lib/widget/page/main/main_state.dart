part of 'main_bloc.dart';

class MainState{
   int selectedIndex;
   bool isExtended;

   MainState({this.selectedIndex, this.isExtended});

  @override
  List<Object> get props => [selectedIndex, isExtended];
}
