part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]);
}

class AppStarted extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LogInWithCredentials extends LoginEvent {
  final LoginDTO loginDTO;

  LogInWithCredentials(this.loginDTO);

  @override
  List<Object?> get props => throw UnimplementedError();
}
class LogInWithGoogle extends LoginEvent{
  @override
  List<Object?> get props => throw UnimplementedError();

}
class LoggedOut extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
