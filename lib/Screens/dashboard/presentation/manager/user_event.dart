part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUser extends UserEvent{
  final String userId;
  const GetUser(this.userId);
  @override
  List<Object?> get props => [userId];
}

class SetUser extends UserEvent{
  final AppUserModel updateUser;
 const SetUser(this.updateUser,);
  @override
  List<Object?> get props => [updateUser];
}


