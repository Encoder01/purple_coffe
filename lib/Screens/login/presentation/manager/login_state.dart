part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginUninitialized extends LoginState {}

class LoginAuthenticated extends LoginState {
 final AppUserModel appUserModel;
  const LoginAuthenticated(this.appUserModel);
}

class LoginUnauthenticated extends LoginState {}

class LoginLoading extends LoginState {}

class ErrorLoggedState extends LoginState {}
