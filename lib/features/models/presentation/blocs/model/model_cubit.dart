import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import 'package:telefonchu/features/models/domain/use_cases/load_model_use_case.dart';
import '../../../../../core/errors/failure.dart';

part 'model_state.dart';

class ModelCubit extends Cubit<ModelState> {
  ModelCubit(
    this.useCase,
  ) : super(const ModelInitial());
  LoadModelUseCase useCase;
  getModel(String docId) async {
    emit(ModelInProgress());
    final result = await useCase.call(docId);
    emit(result.fold((l) => ModelFailure(l), (r) => ModelSuccess(r)));
  }

  initializeWithModel(Model model) async {
    emit(ModelSuccess(model));
  }
}
