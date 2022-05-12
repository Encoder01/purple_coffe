import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/dashboard_firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/UserModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';
import 'package:purple_coffe/core/params/get_fortune_params.dart';
import 'package:purple_coffe/core/params/no_params.dart';

import '../../../../core/error/failures.dart';

class DashboardFirestoreRepositoryImplementation
    implements DashboardFirestoreRepository {
  final DashboardFirestoreDatasource _firestoreRepositoryImplementation;

  DashboardFirestoreRepositoryImplementation(
      this._firestoreRepositoryImplementation);

  @override
  Future<Either<Failure, List<FortuneTells>>> getMyFortunesTell(
      String userId) async {
    try {
      final List<FortuneTells> fortunes =
          await _firestoreRepositoryImplementation
              .getMyFortunesTell(userId);
      return Right(fortunes);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> addFortuneTell(
      FortuneModel addFortune) async {
    try {
      final List<FortuneTells> fortuneTells =
          await _firestoreRepositoryImplementation.addFortuneTell(
        FortuneTells(
          userId: addFortune.userId,
          flatCup: addFortune.flatCup,
          inCup: addFortune.inCup,
          fortune_quest: addFortune.fortune_quest,
          createDate: addFortune.createDate,
          isDone: addFortune.isDone,
          fortuneComment: addFortune.fortuneComment,
        ),
      );
      return Right(fortuneTells);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> setFortuneTell(FortuneModel addFortune) async {
    try {
      final List<FortuneTells> fortuneTells =
          await _firestoreRepositoryImplementation.setFortuneTell(
        FortuneTells(
          fortuneId: addFortune.fortuneId,
          userId: addFortune.userId,
          flatCup: addFortune.flatCup,
          inCup: addFortune.inCup,
          fortune_quest: addFortune.fortune_quest,
          createDate: addFortune.createDate,
          isDone: addFortune.isDone,
          fortuneComment: addFortune.fortuneComment,
        )
      );
      return Right(fortuneTells);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}
