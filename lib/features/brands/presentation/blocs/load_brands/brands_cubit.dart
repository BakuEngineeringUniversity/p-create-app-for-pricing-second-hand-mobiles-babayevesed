import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/core/use_case/use_case.dart';
import 'package:telefonchu/features/brands/data/models/brand.dart';
import 'package:telefonchu/features/brands/domain/use_cases/load_brands.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(this.useCase) : super(BrandsInitial());
  final LoadBrandsUseCase useCase;
  Future<void> getBrands() async {
    final result = await useCase.call(NoParams());
    result.fold((l) => emit(BrandsFailure(l)), (r) => emit(BrandsSuccess(r)));
    return;
  }
}
