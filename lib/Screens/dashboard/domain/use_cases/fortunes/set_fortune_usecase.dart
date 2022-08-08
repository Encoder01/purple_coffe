import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/core/error/failures.dart';
import 'package:purple_coffe/core/params/fortune_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import 'package:purple_coffe/core/usecases/usecases.dart';

class SetFortuneUseCase extends UseCase<List<FortuneTells>, FortuneParams> {
  final DashboardFirestoreRepository firestoreRepository;

  SetFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells>>> call(FortuneParams params) async {
    return  await firestoreRepository.setFortuneTell(params.addFortune, );
  }
}

