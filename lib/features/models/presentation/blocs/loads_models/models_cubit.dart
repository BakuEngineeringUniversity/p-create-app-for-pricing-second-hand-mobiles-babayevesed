import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/use_cases/load_models_use_case.dart';
part 'models_state.dart';

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit(this.loadModelsUseCase) : super(ModelsInitial());
  final LoadModelsUseCase loadModelsUseCase;
  getModels(String brandID) async {
    emit(ModelsInProgress());
    final result = await loadModelsUseCase.call(brandID);
    result.fold((l) => emit(ModelsFailure(l)), (r) => emit(ModelsSuccess(r)));
  }

  dispose() {
    emit(ModelsInitial());
  }
}
