import 'package:equatable/equatable.dart';
import 'package:purple_coffe/core/models/app_env.dart';

class AppEnvironment extends Equatable{
  static AppEnv appEnv = AppEnv.empty();
  @override
  List<Object?> get props => [appEnv];

}