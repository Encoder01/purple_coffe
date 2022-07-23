import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:purple_coffe/Screens/login/domain/entities/LoginModel.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/check_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/login_google.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/reset_pass_usecase.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_out.dart';
import 'package:purple_coffe/Screens/login/domain/use_cases/sign_up.dart';

import '../../data/models/user.dart';
import '../dto/login_dto.dart';
import '/core/params/login_params.dart';
import '/core/params/no_params.dart';

part "login_event.dart";

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUserCase loginUseCase;
  final CheckAuthenticationUseCase checkAuthenticationUseCase;
  final LoginGoogleUseCase loginGoogleUseCase;
  final SignOutUseCase signOutUseCase;
  final SignUpUseCase signUpUseCase;
  final ResetPassUseCase resetPassUseCase;

  @override
  LoginBloc(
    this.loginUseCase,
    this.loginGoogleUseCase,
    this.signOutUseCase,
    this.signUpUseCase,
    this.checkAuthenticationUseCase,
    this.resetPassUseCase,
  ) : super(LoginUninitialized()) {
    on<AppStarted>((event, emit) async {
      final result = await checkAuthenticationUseCase.call(NoParams());
      result.fold(
        (failure) => emit(ErrorLoggedState()),
        (user) => {
          emit(LoginAuthenticated(user)),
        },
      );
    });
    on<LogInWithEmailPassword>((event, emit) async {
      emit(LoginLoading());
      final result = await loginUseCase.call(
        LoginParams(
          login: LoginModel(
            email: event.loginDTO.email,
            password: event.loginDTO.password,
          ),
        ),
      );
      result.fold(
        (failure) => emit(ErrorLoggedState()),
        (user) => {
          emit(LoginAuthenticated(user)),
        },
      );
    });
    on<SignUpWithEmailPassword>((event, emit) async {
      print(event.loginDTO.email);
      final result = await signUpUseCase.call(
        LoginParams(
          login: LoginModel(
            email: event.loginDTO.email,
            password: event.loginDTO.password,
          ),
        ),
      );
      result.fold((failure) {
        emit(ErrorLoggedState());
      }, (success) {
        emit(LoginAuthenticated(success));
      });
    });

    on<LogInWithGoogle>((event, emit) async {
      emit(LoginLoading());
      final result = await loginGoogleUseCase.call(NoParams());
      result.fold((failure) {
        print(failure.toString());
        emit(ErrorLoggedState());
      }, (success) {
        print(success.toString());
        emit(LoginAuthenticated(success));
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
    on<ResPassMail>((event, emit) async {
      emit(LoginLoading());
      final result = await resetPassUseCase.call(ResPassParam(event.mail));
      result.fold(
        (error) => emit(ErrorLoggedState()),
        (value) => emit(LoginUnauthenticated()),
      );
    });
  }
}
