import 'package:equatable/equatable.dart';

import '../../Screens/dashboard/domain/entities/AddUserModel.dart';

class AddUserParams extends Equatable {
  final AddUserModel addUser;

  const AddUserParams({
    required this.addUser,
  });

  @override
  List<Object> get props => [addUser];
}