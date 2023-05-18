import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/features/models/domain/use_cases/delete_model_use_case.dart';
import '../../../../../core/errors/failure.dart';
part 'delete_model_state.dart';

class DeleteModelCubit extends Cubit<DeleteModelState> {
  DeleteModelCubit(this.useCase) : super(DeleteModelInitial());
  final DeleteModelUseCase useCase;
  deleteModel(String docID) async {
    emit(DeleteModelInProgress());
    final result = await useCase.call(docID);
    result.fold((l) => emit(DeleteModelFailure(l)), (r) => emit(DeleteModelSuccess()));
  }
}
