import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'data_statistics_event.dart';

part 'data_statistics_state.dart';

class DataStatisticsBloc
    extends Bloc<DataStatisticsEvent, DataStatisticsState> {
  DataStatisticsBloc() : super(DataStatisticsInitial());

  @override
  Stream<DataStatisticsState> mapEventToState(
    DataStatisticsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
