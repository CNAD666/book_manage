import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'font_event.dart';
part 'font_state.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  FontBloc() : super(FontInitial());

  @override
  Stream<FontState> mapEventToState(
    FontEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
