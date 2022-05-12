part of 'fortune_bloc.dart';

abstract class FortuneState extends Equatable {
  const FortuneState();
}

class FortuneInitial extends FortuneState {
  @override
  List<Object> get props => [];
}

class FortuneLoading extends FortuneState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FortuneLoaded extends FortuneState {
  List<FortuneTells> fortuneTells;

  FortuneLoaded(this.fortuneTells,);

  @override
  List<Object?> get props => fortuneTells;
}

class ErrorFortuneLoad extends FortuneState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
