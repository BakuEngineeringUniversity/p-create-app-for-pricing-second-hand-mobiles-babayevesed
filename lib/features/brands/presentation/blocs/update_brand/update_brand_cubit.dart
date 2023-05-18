import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/features/brands/domain/use_cases/update_brand_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/brand.dart';

part 'update_brand_state.dart';

class UpdateBrandCubit extends Cubit<UpdateBrandState> {
  UpdateBrandCubit(this.useCase) : super(UpdateBrandInitial());
  final UpdateBrandUseCase useCase;
  updateBrand(BrandModel brand) async {
    emit(UpdateBrandLoading());
    final result = await useCase.call(brand);
    result.fold((l) => emit(UpdateBrandFailure(l)), (r) => emit(UpdateBrandSuccess(r)));
  }
}
