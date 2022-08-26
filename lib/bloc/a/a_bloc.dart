import 'package:bloc/bloc.dart';

import 'a_event.dart';
import 'a_state.dart';

class ABloc extends Bloc<AEvent, AState> {
  ABloc() : super(AState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<AState> emit) async {
    emit(state.clone());
  }
}
