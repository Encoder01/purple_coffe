import 'package:equatable/equatable.dart';

import '../../Screens/login/domain/entities/LoginModel.dart';

class LoginParams extends Equatable {
  final LoginModel login;

  const LoginParams({
    required this.login,
  });

  @override
  List<Object> get props => [login];
}