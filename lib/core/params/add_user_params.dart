import 'package:equatable/equatable.dart';

import '../../Screens/dashboard/domain/entities/UserModel.dart';

class AddUserParams extends Equatable {
  final UserModel addUser;

  const AddUserParams({
    required this.addUser,
  });

  @override
  List<Object> get props => [addUser];
}