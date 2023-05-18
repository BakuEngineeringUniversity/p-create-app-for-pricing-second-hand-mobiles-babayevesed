import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/model_entity.dart';
import '../repositories/model_repository.dart';

class AddModelUseCase extends Usecase<Model, Model> {
  AddModelUseCase(this.repository);

  final ModelsRepository repository;

  @override
  Future<Either<Failure, Model>> call(Model params) {
    return repository.addModel(params);
  }
}
