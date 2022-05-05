import 'package:equatable/equatable.dart';
class AddUserModel extends Equatable {
  final String adSoyad;
  final String dateTime;
  final String userId;

  AddUserModel({required this.adSoyad, required this.dateTime,required this.userId});

  @override
  List<Object> get props => [adSoyad, dateTime,userId];
}