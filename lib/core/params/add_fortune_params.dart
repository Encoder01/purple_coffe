import 'package:equatable/equatable.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddFortuneModel.dart';

class AddFortuneParams extends Equatable {
  final AddFortuneModel addFortune;

  const AddFortuneParams({
    required this.addFortune,
  });

  @override
  List<Object> get props => [addFortune];
}