class FortuneTells {
  bool? isDone;
  List<String>? inCup;
  String? userId;
  List<String>? flatCup;
  String? fortuneComment;

  FortuneTells(
      {this.isDone,
      this.inCup,
      this.userId,
      this.flatCup,
      this.fortuneComment});

  FortuneTells.fromJson(Map<String, dynamic> json) {
    isDone = json['is_done'] as bool;
    inCup = json['in_cup'].cast<String>() as List<String>;
    userId = json['user_id'] as String;
    flatCup = json['flat_cup'].cast<String>() as List<String>;
    fortuneComment = json['fortune_comment'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_done'] = this.isDone;
    data['in_cup'] = this.inCup;
    data['user_id'] = this.userId;
    data['flat_cup'] = this.flatCup;
    data['fortune_comment'] = this.fortuneComment;
    return data;
  }
}
