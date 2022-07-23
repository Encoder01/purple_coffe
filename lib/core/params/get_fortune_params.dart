import 'package:equatable/equatable.dart';

class GetFortuneParams extends Equatable {
  final String userId;

  const GetFortuneParams({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}