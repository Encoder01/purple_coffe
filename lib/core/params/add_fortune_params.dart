import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';

class AddFortuneParams extends Equatable {
  final FortuneModel addFortune;

  const AddFortuneParams({
    required this.addFortune,
  });

  @override
  List<Object> get props => [addFortune];
}