import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/model_repository.dart';

class DeleteModelUseCase extends Usecase<void, String> {
  DeleteModelUseCase(this.repository);

  final ModelsRepository repository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return repository.deleteModel(params);
  }
}
