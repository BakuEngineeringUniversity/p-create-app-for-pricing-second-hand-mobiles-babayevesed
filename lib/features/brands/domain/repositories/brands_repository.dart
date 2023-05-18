import 'package:dartz/dartz.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';

abstract class BrandRepository {
  Future<Either<Failure, List<BrandModel>>> loadBrands();
  Future<Either<Failure, BrandModel>> addBrand(BrandModel brand);
  Future<Either<Failure, BrandModel>> updateBrand(BrandModel brand);
  Future<Either<Failure, void>> deleteBrand(String docID);
}
