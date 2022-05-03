import 'package:equatable/equatable.dart';
class AppUserModel extends Equatable {
  final String uid;
  final String name;
  final String lastName;
  final DateTime birthDate;
  final List<String> fTellId;

  const AppUserModel({
    required this.uid,
    required this.name,
    required this.lastName,
    required this.birthDate,
    required this.fTellId,
  });
  factory AppUserModel.empty() {
    return   AppUserModel(
      uid: '',
      name: '',
      lastName: '',
      birthDate: DateTime.now(),
      fTellId: const [''],
    );
  }
  @override
  List<Object> get props => [uid, name, lastName, birthDate, fTellId];
}
