import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String sex;
  final DateTime birthDate;
  final List<String> fTellId;
  final List<String> notifications;

  const UserModel(
      {required this.name,
      required this.email,
      required this.uid,
      required this.fTellId,
      required this.birthDate,
      required this.notifications,
      required this.sex});

  @override
  List<Object> get props => [name, email, uid, fTellId, birthDate, sex];
}
