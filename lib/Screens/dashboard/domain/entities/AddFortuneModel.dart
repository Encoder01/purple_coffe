import 'package:equatable/equatable.dart';

class AddFortuneModel extends Equatable{
  final String userId;
  final List<String> flatCup;
  final List<String> inCup;

  const AddFortuneModel({required this.userId, required this.flatCup,required this.inCup});

  @override
  List<Object> get props => [userId, flatCup,inCup];
}