import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/params/fortune_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/params/user_params.dart';
import '../../../../core/usecases/usecases.dart';

class DeleteFortuneUseCase extends UseCase<List<FortuneTells>, FortuneParams> {
  final DashboardFirestoreRepository firestoreRepository;

  DeleteFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells>>> call(FortuneParams params) async {
    return  await firestoreRepository.deleteFortuneTell(params.addFortune);
  }
}

