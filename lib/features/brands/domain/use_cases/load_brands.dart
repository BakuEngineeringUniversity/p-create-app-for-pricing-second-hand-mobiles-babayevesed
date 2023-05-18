import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/domain/repositories/brands_repository.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_case/use_case.dart';

class LoadBrandsUseCase extends Usecase<List<BrandModel>, NoParams> {
  LoadBrandsUseCase(this.repository);

  final BrandRepository repository;

  @override
  Future<Either<Failure, List<BrandModel>>> call(NoParams params) {
    return repository.loadBrands();
  }
}
