import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/models/fortune_tells.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/FortuneModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/UserModel.dart';
import 'package:purple_coffe/core/params/no_params.dart';

import '../../../../core/error/failures.dart';
import '../../../login/data/models/user.dart';

abstract class DashboardFirestoreRepository {
  Future<Either<Failure, List<FortuneTells>>> addFortuneTell(
      FortuneModel addFortune);
  Future<Either<Failure, List<FortuneTells>>> setFortuneTell(
      FortuneModel updateFortune, );
  Future<Either<Failure, AppUserModel>> setUserInfo(
      AppUserModel updateUser, );
  Future<Either<Failure, AppUserModel>> getUserInfo(
      String userId, );
  Future<Either<Failure, List<FortuneTells>>> getMyFortunesTell(String userId);
}
