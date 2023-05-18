import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/model_repository.dart';

class UpdateModelUseCase extends Usecase<Model, Model> {
  UpdateModelUseCase(this.repository);

  final ModelsRepository repository;

  @override
  Future<Either<Failure, Model>> call(Model params) {
    return repository.update(params);
  }
}
