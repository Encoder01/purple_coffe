import 'package:equatable/equatable.dart';

class FortuneModel extends Equatable {
  final DateTime createDate;
  final List<String> flatCup;
  final String fortuneComment;
  final Map<String, dynamic> fortune_quest;
  final List<String> inCup;
  final bool isDone;
  final String userId;
  final String fortuneId;

  const FortuneModel({
    required this.fortuneId,
    required this.userId,
    required this.flatCup,
    required this.inCup,
    required this.fortune_quest,
    required this.createDate,
    required this.isDone,
    required this.fortuneComment,
  });

  @override
  List<Object> get props => [
        userId,
        flatCup,
        inCup,
        createDate,
        fortuneComment,
        isDone,
        fortune_quest,
      ];
}
