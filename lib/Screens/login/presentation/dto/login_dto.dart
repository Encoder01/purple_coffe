import 'package:equatable/equatable.dart';

class LoginDTO extends Equatable {
  final String email;
  final String? password;
  final String? emailLink;

  LoginDTO({
    required this.email,
      this.emailLink,this.password,
  });

  @override
  List<Object> get props => [
    email,
    emailLink??"",
    password??""
  ];
}
