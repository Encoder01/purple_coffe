import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/params/user_params.dart';
import '../../../../../core/usecases/usecases.dart';

class SetUserUseCase extends UseCase<AppUserModel, UserParams> {
  final DashboardFirestoreRepository firestoreRepository;

  SetUserUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, AppUserModel>> call(UserParams params) async {
    return  await firestoreRepository.setUserInfo(params.setUserMode, );
  }
}

