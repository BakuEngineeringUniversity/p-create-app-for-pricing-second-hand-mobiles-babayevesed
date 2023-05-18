import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/use_cases/update_model_use_case.dart';
import '../../../../../core/errors/failure.dart';
part 'update_model_state.dart';

class UpdateModelCubit extends Cubit<UpdateModelState> {
  UpdateModelCubit(this.useCase) : super(UpdateModelInitial());
  UpdateModelUseCase useCase;
  updateModel(Model model) async {
    emit(UpdateModelInProgress());
    final result = await useCase.call(model);
    result.fold((l) => emit(UpdateModelFailure(l)), (r) => emit(UpdateModelSuccess(r)));
  }
}
