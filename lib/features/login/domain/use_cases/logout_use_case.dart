import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/login/domain/repositories/user_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class LogOutUseCase extends Usecase<void, NoParams> {
  LogOutUseCase(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logOut();
  }
}
