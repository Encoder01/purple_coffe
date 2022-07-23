part of 'fortune_bloc.dart';

abstract class FortuneEvent extends Equatable {
  const FortuneEvent();
}

class GetMyFortunes extends FortuneEvent{
  final String userId;
  GetMyFortunes(this.userId);
  @override
  List<Object?> get props => [userId];
}

class AddFortunes extends FortuneEvent{
  FortuneModel addFortune;
  AddFortunes(this.addFortune,);
  @override
  List<Object?> get props => [addFortune];
}

class SetFortunes extends FortuneEvent{
  FortuneModel addFortune;
  SetFortunes(this.addFortune,);
  @override
  List<Object?> get props => [addFortune];
}
class DeleteFortunes extends FortuneEvent{
  FortuneModel addFortune;
  DeleteFortunes(this.addFortune,);
  @override
  List<Object?> get props => [addFortune];
}