import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/add_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/delete_fortune_usercase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/get_fortune_usecase.dart';
import 'package:purple_coffe/Screens/dashboard/domain/use_cases/set_fortune_usecase.dart';
import 'package:purple_coffe/core/params/fortune_params.dart';
import 'package:purple_coffe/core/params/get_fortune_params.dart';

import '../../data/models/fortune_tells.dart';
import '../../domain/entities/FortuneModel.dart';

part 'fortune_event.dart';

part 'fortune_state.dart';

class FortuneBloc extends Bloc<FortuneEvent, FortuneState> {
  AddFortuneUseCase addFortuneUseCase;
  SetFortuneUseCase setFortuneUseCase;
  GetFortuneUseCase getFortuneUseCase;
  DeleteFortuneUseCase deleteFortuneUseCase;

  FortuneBloc(
      this.addFortuneUseCase, this.getFortuneUseCase, this.setFortuneUseCase,this.deleteFortuneUseCase)
      : super(FortuneInitial()) {
    on<GetMyFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await getFortuneUseCase
          .call(GetFortuneParams(userId: event.userId));
      result.fold(
        (failure) => emit(ErrorFortuneLoad()),
        (fortunes) => {
          emit(FortuneLoaded(fortunes,)),
        },
      );
    });
    on<AddFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await addFortuneUseCase
          .call(FortuneParams(addFortune: event.addFortune));
      result.fold(
        (failure) => emit(ErrorFortuneLoad()),
        (fortunes) => {
          emit(FortuneLoaded(fortunes,)),
        },
      );
    });
    on<SetFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await setFortuneUseCase
          .call(FortuneParams(addFortune: event.addFortune,));
      result.fold(
        (failure) => emit(ErrorFortuneLoad()),
        (fortunes) => {
          emit(FortuneLoaded(fortunes, )),
        },
      );
    });
    on<DeleteFortunes>((event, emit) async {
      emit(FortuneLoading());
      final result = await deleteFortuneUseCase
          .call(FortuneParams(addFortune: event.addFortune,));
      result.fold(
            (failure) => emit(ErrorFortuneLoad()),
            (fortunes) => {
          emit(FortuneLoaded(fortunes, )),
        },
      );
    });
  }
}
