import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/params/user_params.dart';

import '../../../../core/params/get_user_params.dart';
import '../../domain/use_cases/get_user_usecase.dart';
import '../../domain/use_cases/set_user_usercase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  SetUserUseCase setUserUseCase;
  GetUserUseCase getUserUseCase;

  UserBloc(this.getUserUseCase, this.setUserUseCase) : super(UserInitial()) {
    on<SetUser>((event, emit) async {
      final result = await setUserUseCase.call(UserParams(
        setUserMode: event.updateUser,
      ));
      result.fold(
        (failure) => emit(ErrorUserLoad()),
        (user) => {
          emit(UserLoaded(user)),
        },
      );
    });
    on<GetUser>((event, emit) async {
      final result =
          await getUserUseCase.call(GetUserParams(userId: event.userId));
      result.fold(
        (failure) => emit(ErrorUserLoad()),
        (user) => {
          emit(UserLoaded(user)),
        },
      );
    });
  }
}
