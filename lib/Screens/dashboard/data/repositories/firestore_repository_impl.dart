import 'package:dartz/dartz.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/firestore_datasource.dart';
import 'package:purple_coffe/Screens/dashboard/data/data_sources/firestore_datasource_impl.dart';
import 'package:purple_coffe/Screens/dashboard/domain/entities/AddUserModel.dart';
import 'package:purple_coffe/Screens/dashboard/domain/repositories/firestore_repository.dart';
import 'package:purple_coffe/core/params/no_params.dart';

import '../../../../core/error/failures.dart';

class FirestoreRepositoryImplementation implements FirestoreRepository {
  final FirestoreDatasource _firestoreRepositoryImplementation;

  FirestoreRepositoryImplementation(this._firestoreRepositoryImplementation);

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
  Future<Either<Failure, NoParams>> getMyFortunesTell() {
    // TODO: implement getMyFortunesTell
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NoParams>> sendFortuneTell() {
    // TODO: implement sendFortuneTell
    throw UnimplementedError();
  }
}
