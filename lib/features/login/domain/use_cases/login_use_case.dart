import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/login/domain/entities/user_dto.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';
import 'package:telefonchu/features/login/domain/repositories/user_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class LoginUseCase extends Usecase<UserEntity, UserDto> {
  LoginUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(UserDto params) {
    return repository.login(params.email, params.password);
  }
}
