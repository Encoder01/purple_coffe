import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';

class FortuneParams extends Equatable {
  final FortuneModel addFortune;
    FortuneParams({
    required this.addFortune,
  });

  @override
  List<Object> get props => [addFortune];
}