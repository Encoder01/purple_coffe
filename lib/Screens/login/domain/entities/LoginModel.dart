import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String email;
  final String? password;
  final String? emailLink;

  LoginModel({required this.email, this.emailLink,this.password});

  @override
  List<Object> get props => [email, emailLink ?? "",password??""];
}
