part of 'update_model_cubit.dart';

abstract class UpdateModelState extends Equatable {
  const UpdateModelState();

  @override
  List<Object> get props => [];
}

class UpdateModelInitial extends UpdateModelState {}

class UpdateModelInProgress extends UpdateModelState {}

class UpdateModelSuccess extends UpdateModelState {
  final Model model;
  const UpdateModelSuccess(this.model);
  @override
  List<Object> get props => [model];
}

class UpdateModelFailure extends UpdateModelState {
  final Failure failure;
  const UpdateModelFailure(this.failure);
}
