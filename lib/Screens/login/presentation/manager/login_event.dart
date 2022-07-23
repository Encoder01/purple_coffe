part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]);
}

class AppStarted extends LoginEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LogInWithEmailLink extends LoginEvent {
  final LoginDTO loginDTO;

  LogInWithEmailLink(this.loginDTO);

  @override
  List<Object?> get props => throw UnimplementedError();
}
class SignUpWithEmailLink extends LoginEvent {
  final LoginDTO loginDTO;

  SignUpWithEmailLink(this.loginDTO);

  @override
  List<Object?> get props => throw UnimplementedError();
}
class LogInWithEmailPassword extends LoginEvent {
  final LoginDTO loginDTO;

  LogInWithEmailPassword(this.loginDTO);

  @override
  List<Object?> get props => throw UnimplementedError();
}
class SignUpWithEmailPassword extends LoginEvent {
  final LoginDTO loginDTO;

  SignUpWithEmailPassword(this.loginDTO);

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
class ResPassMail extends LoginEvent {
  final String mail;
  ResPassMail(this.mail);
  @override
  List<Object?> get props => throw UnimplementedError();
}
