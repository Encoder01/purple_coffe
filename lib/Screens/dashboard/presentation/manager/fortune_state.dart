part of 'fortune_bloc.dart';

abstract class FortuneState extends Equatable {
  const FortuneState();
}

class FortuneInitial extends FortuneState {
  @override
  List<Object> get props => [];
}
