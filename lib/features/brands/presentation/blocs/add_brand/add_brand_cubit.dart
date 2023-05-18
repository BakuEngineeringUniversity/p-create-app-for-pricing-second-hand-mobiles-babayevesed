import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/features/brands/domain/use_cases/add_brand_use_case.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/brand.dart';

part 'add_brand_state.dart';

class AddBrandCubit extends Cubit<AddBrandState> {
  AddBrandCubit(this.useCase) : super(AddBrandInitial());
  final AddBrandUseCase useCase;
  addBrand(BrandModel brand) async {
    emit(AddBrandLoading());
    final result = await useCase.call(brand);
    result.fold((l) => emit(AddBrandFailure(l)), (r) => emit(AddBrandSuccess(r)));
  }
}
