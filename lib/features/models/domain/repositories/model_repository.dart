import 'package:dartz/dartz.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';

abstract class ModelsRepository {
  Future<Either<Failure, List<Model>>> loadModels(String brandID);
  Future<Either<Failure, Model>> addModel(Model model);
  Future<Either<Failure, Model>> getModel(String docID);
  Future<Either<Failure, void>> deleteModel(String docID);
  Future<Either<Failure, Model>> update(Model model);
}
