import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/model_repository.dart';

class LoadModelsUseCase extends Usecase<List<Model>, String> {
  LoadModelsUseCase(this.repository);

  final ModelsRepository repository;

  @override
  Future<Either<Failure, List<Model>>> call(String params) {
    return repository.loadModels(params);
  }
}
