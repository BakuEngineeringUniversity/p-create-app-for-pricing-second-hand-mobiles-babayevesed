import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/domain/repositories/brands_repository.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class AddBrandUseCase extends Usecase<BrandModel, BrandModel> {
  AddBrandUseCase(this.repository);

  final BrandRepository repository;

  @override
  Future<Either<Failure, BrandModel>> call(BrandModel params) {
    return repository.addBrand(params);
  }
}
