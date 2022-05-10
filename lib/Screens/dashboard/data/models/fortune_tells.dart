import 'package:cloud_firestore/cloud_firestore.dart';

class FortuneTells {
  DateTime? createDate;
  List<String>? flatCup;
  String? fortuneComment;
  Map<String, dynamic>? fortune_quest;
  List<String>? inCup;
  bool? isDone;
  String? userId;

  FortuneTells(
      {this.createDate,
      this.flatCup,
      this.fortuneComment,
      this.fortune_quest,
      this.inCup,
      this.isDone,
      this.userId});

  FortuneTells.fromJson(Map<String, dynamic> json) {
    createDate = DateTime.fromMicrosecondsSinceEpoch(
        (json['create_date'] as Timestamp).microsecondsSinceEpoch);
    flatCup = json['flat_cup'].cast<String>() as List<String>;
    fortuneComment = json['fortune_comment'] as String;
    fortune_quest = json['fortune_quest'] as Map<String, dynamic>;
    inCup = json['in_cup'].cast<String>() as List<String>;
    isDone = json['is_done'] as bool;
    userId = json['user_id'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['create_date']=createDate;
    data['flat_cup'] = flatCup;
    data['fortune_comment'] = fortuneComment;
    data['fortune_quest']=fortune_quest;
    data['in_cup'] = inCup;
    data['is_done'] = isDone;
    data['user_id'] = userId;
    return data;
  }
}
