import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/brands/domain/repositories/brands_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class DeleteBrandUseCase extends Usecase<void, String> {
  DeleteBrandUseCase(this.repository);

  final BrandRepository repository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return repository.deleteBrand(params);
  }
}
