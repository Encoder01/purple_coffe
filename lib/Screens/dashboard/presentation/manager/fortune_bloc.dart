import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fortune_event.dart';
part 'fortune_state.dart';

class FortuneBloc extends Bloc<FortuneEvent, FortuneState> {
  FortuneBloc() : super(FortuneInitial()) {
    on<FortuneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
