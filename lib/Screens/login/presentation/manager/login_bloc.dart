import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/login/domain/entities/LoginModel.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/check_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login_google.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_up.dart';

import '../dto/login_dto.dart';
import '/core/params/login_params.dart';
import '/core/params/no_params.dart';

part "login_event.dart";
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUseCase;
  final CheckAuthenticationUseCase checkAuthenticationUseCase;
  final LoginGoogle loginGoogleUseCase;
  final SignOut signOutUseCase;
  final SignUp signUpUseCase;

  @override
  LoginBloc(
    this.loginUseCase,
    this.loginGoogleUseCase,
    this.signOutUseCase,
    this.signUpUseCase,
    this.checkAuthenticationUseCase,
  ) : super(LoginUninitialized()) {
    on<AppStarted>((event, emit) async {
      final result = await checkAuthenticationUseCase.call(NoParams());
      result.fold(
        (failure) => emit(ErrorLoggedState()),
        (user) => {
          emit(LoginAuthenticated()),
        },
      );
    });
    on<LogInWithCredentials>((event, emit) async {
      final result = await loginUseCase.call(
        LoginParams(
          login: LoginModel(
            username: event.loginDTO.username,
            password: event.loginDTO.password,
          ),
        ),
      );
      result.fold(
        (failure) => emit(ErrorLoggedState()),
        (user) => {
          emit(LoginAuthenticated()),
        },
      );
    });

    on<LogInWithGoogle>((event, emit) async {
      emit(LoginLoading());
      final result = await loginGoogleUseCase.call(NoParams());
      result.fold((failure) async* {
        print(failure.toString());
        emit(ErrorLoggedState());
      }, (success) async* {
        print(success.toString());
        emit(LoginAuthenticated());
      });
    });

    on<LoggedOut>((event, emit) async {
      emit(LoginLoading());
      final result = await signOutUseCase.call(NoParams());
      result.fold(
        (error) => emit(ErrorLoggedState()),
        (value) => emit(LoginUnauthenticated()),
      );
    });
  }
}
