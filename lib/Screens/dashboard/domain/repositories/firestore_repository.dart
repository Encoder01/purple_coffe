import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddUserModel.dart';
import 'package:purple_coffe/core/params/no_params.dart';

import '../../../../core/error/failures.dart';

abstract class FirestoreRepository{
  Future<Either<Failure, NoParams>> addUser(AddUserModel addUser);

  Future<Either<Failure, NoParams>> sendFortuneTell();

  Future<Either<Failure, NoParams>> getMyFortunesTell();
}