import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/params/get_fortune_params.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/params/get_user_params.dart';
import '../../../../../core/usecases/usecases.dart';

class GetUserUseCase extends UseCase<AppUserModel, GetUserParams> {
  final DashboardFirestoreRepository firestoreRepository;

  GetUserUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, AppUserModel>> call(GetUserParams params) async {
    return  await firestoreRepository.getUserInfo(params.userId);
  }
}

