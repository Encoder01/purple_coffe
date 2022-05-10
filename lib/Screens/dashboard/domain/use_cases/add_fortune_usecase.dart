import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/core/params/add_fortune_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class AddFortuneUseCase extends UseCase<NoParams, AddFortuneParams> {
  final DashboardFirestoreRepository firestoreRepository;

  AddFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, NoParams>> call(AddFortuneParams params) async {
    return  await firestoreRepository.addFortuneTell(params.addFortune);
  }
}

