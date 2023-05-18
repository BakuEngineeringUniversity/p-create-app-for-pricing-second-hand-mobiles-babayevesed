import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/use_cases/delete_brand_use_case.dart';

part 'delete_brand_state.dart';

class DeleteBrandCubit extends Cubit<DeleteBrandState> {
  DeleteBrandCubit(this.useCase) : super(DeleteBrandInitial());
  final DeleteBrandUseCase useCase;
  deleteBrand(String docID) async {
    emit(DeleteBrandLoading());
    final result = await useCase.call(docID);
    result.fold((l) => emit(DeleteBrandFailure(l)), (r) => emit(const DeleteBrandSuccess()));
  }
}
