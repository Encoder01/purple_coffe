import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class UseCase<Type, Equatable> {
  Future<Either<Failure, Type>> call(Equatable params);
}


