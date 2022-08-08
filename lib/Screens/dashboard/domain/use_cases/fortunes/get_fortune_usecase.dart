import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/core/params/get_fortune_params.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/usecases/usecases.dart';

class GetFortuneUseCase extends UseCase<List<FortuneTells>, GetFortuneParams> {
  final DashboardFirestoreRepository firestoreRepository;

  GetFortuneUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, List<FortuneTells> >> call(GetFortuneParams params) async {
    return  await firestoreRepository.getMyFortunesTell(params.userId);
  }
}

