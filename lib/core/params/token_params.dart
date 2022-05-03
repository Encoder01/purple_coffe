import 'package:equatable/equatable.dart';

class TokenParams extends Equatable {
  String? token;
  TokenParams({this.token});
  @override
  List<Object?> get props => [token];
}

