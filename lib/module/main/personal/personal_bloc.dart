import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personal_event.dart';
part 'personal_state.dart';

class PersonalBloc extends Bloc<PersonalEvent, PersonalState> {
  PersonalBloc() : super(PersonalInitial());

  @override
  Stream<PersonalState> mapEventToState(
    PersonalEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
