import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/firestore_repository.dart';
import 'package:purple_coffe/core/params/add_user_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class AddUserUseCase extends UseCase<NoParams, AddUserParams> {
  final FirestoreRepository firestoreRepository;

  AddUserUseCase(this.firestoreRepository);

  @override
  Future<Either<Failure, NoParams>> call(AddUserParams params) async {
    return  await firestoreRepository.addUser(params.addUser);
  }
}

