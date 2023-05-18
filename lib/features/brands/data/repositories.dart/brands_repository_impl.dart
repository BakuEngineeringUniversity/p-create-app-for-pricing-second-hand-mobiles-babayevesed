import 'package:telefonchu/features/brands/data/datasources/brands_datasource.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:telefonchu/features/brands/domain/repositories/brands_repository.dart';

class BrandsRepositoryImpl extends BrandRepository {
  final BrandsDataSource dataSource;
  BrandsRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<BrandModel>>> loadBrands() async {
    try {
      final data = await dataSource.loadBrands();
      return Right(data);
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteBrand(String docID) async {
    try {
      final data = await dataSource.deleteBrand(docID);
      return Right(data);
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandModel>> updateBrand(BrandModel brand) async {
    try {
      final data = await dataSource.updateBrands(brand);
      return Right(data);
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, BrandModel>> addBrand(BrandModel brand) async {
    try {
      final data = await dataSource.addBrand(brand);
      return Right(data);
    } catch (e) {
      return Left(UnknownFailure(errorMessage: e.toString()));
    }
  }
}
