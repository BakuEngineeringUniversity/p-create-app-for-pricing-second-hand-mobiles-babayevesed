import 'package:dartz/dartz.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, void>> logOut();
}
