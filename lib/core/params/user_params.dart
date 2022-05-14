import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

class UserParams extends Equatable {
  final AppUserModel setUserMode;
    UserParams({
    required this.setUserMode,
  });

  @override
  List<Object> get props => [setUserMode];
}