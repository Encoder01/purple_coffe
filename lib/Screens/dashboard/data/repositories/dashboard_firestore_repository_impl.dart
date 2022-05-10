import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/dashboard_firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddFortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddUserModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/core/params/get_fortune_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';

import '../../../../core/error/failures.dart';

class DashboardFirestoreRepositoryImplementation implements DashboardFirestoreRepository {
  final DashboardFirestoreDatasource _firestoreRepositoryImplementation;

  DashboardFirestoreRepositoryImplementation(this._firestoreRepositoryImplementation);

  @override
  Future<Either<Failure, NoParams>> addUser(AddUserModel addUser) async {
    try {
      await _firestoreRepositoryImplementation.addUser(
        addUser.adSoyad,
        addUser.dateTime,
        addUser.userId,
      );
      return Right(NoParams());
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> getMyFortunesTell(List<String> fortuneIds) async{
    try {
     final List<FortuneTells> fortunes= await _firestoreRepositoryImplementation.getMyFortunesTell(fortuneIds);
     print("success");
      return Right(fortunes);
    } catch (exception) {
      print("failed");

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> addFortuneTell(AddFortuneModel addFortune) async{
    try {
      await _firestoreRepositoryImplementation.addFortuneTell(
        addFortune.userId,
        addFortune.flatCup,
        addFortune.inCup,
      );
      return Right(NoParams());
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}
