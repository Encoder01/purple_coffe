import 'package:equatable/equatable.dart';

class GetFortuneParams extends Equatable {
  final List<String> fortuneIds;

  const GetFortuneParams({
    required this.fortuneIds,
  });

  @override
  List<Object> get props => [fortuneIds];
}