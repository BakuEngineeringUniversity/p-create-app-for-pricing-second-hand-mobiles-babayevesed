import 'package:telefonchu/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/login/data/data_sources/remote/user_data_source.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';
import 'package:telefonchu/features/login/domain/repositories/user_repository.dart';

import '../data_sources/remote/local_data_service.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource dataSource;
  final UserLocalDataSource localDataSource;
  UserRepositoryImpl(this.dataSource, this.localDataSource);
  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final result = await dataSource.login(email, password);
      await localDataSource.saveUser(result);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      final result = await localDataSource.logOut();
      return Right(result);
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }
}
