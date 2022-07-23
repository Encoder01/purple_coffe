import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/dashboard_firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/dashobard_firestore_repository.dart';
import 'package:purple_coffe/Screens/login/data/models/user.dart';

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
          await _firestoreRepositoryImplementation.getMyFortunesTell(userId);
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
          fortuneNotif: addFortune.fortuneNotif,
          fortuneId: addFortune.fortuneId,
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
  Future<Either<Failure, List<FortuneTells>>> setFortuneTell(
      FortuneModel addFortune) async {
    try {
      final List<FortuneTells> fortuneTells =
          await _firestoreRepositoryImplementation.setFortuneTell(FortuneTells(
        fortuneId: addFortune.fortuneId,
        userId: addFortune.userId,
        flatCup: addFortune.flatCup,
        inCup: addFortune.inCup,
        fortune_quest: addFortune.fortune_quest,
        fortuneNotif: addFortune.fortuneNotif,
        createDate: addFortune.createDate,
        isDone: addFortune.isDone,
        fortuneComment: addFortune.fortuneComment,
      ));
      return Right(fortuneTells);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUserModel>> getUserInfo(String userId) async {
    try {
      final AppUserModel userPofile =
          await _firestoreRepositoryImplementation.getUserInfo(userId);
      return Right(userPofile);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AppUserModel>> setUserInfo(AppUserModel updateUser) async {
    try {
      final AppUserModel userPofile =
          await _firestoreRepositoryImplementation.setUserInfo(updateUser);
      return Right(userPofile);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<FortuneTells>>> deleteFortuneTell(FortuneModel deleteFortune) async{
    try {
      final List<FortuneTells> fortuneTells =
      await _firestoreRepositoryImplementation.deleteFortuneTell(FortuneTells(
        fortuneId: deleteFortune.fortuneId,
        userId: deleteFortune.userId,
        flatCup: deleteFortune.flatCup,
        inCup: deleteFortune.inCup,
        fortuneNotif: deleteFortune.fortuneNotif,
        fortune_quest: deleteFortune.fortune_quest,
        createDate: deleteFortune.createDate,
        isDone: deleteFortune.isDone,
        fortuneComment: deleteFortune.fortuneComment,
      ));
      return Right(fortuneTells);
    } catch (exception) {
      return Left(ServerFailure());
    }
  }
}
