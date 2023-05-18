part of 'model_cubit.dart';

abstract class ModelState extends Equatable {
  const ModelState();

  @override
  List<Object> get props => [];
}

class ModelInitial extends ModelState {
  const ModelInitial();
}

class ModelInProgress extends ModelState {}

class ModelSuccess extends ModelState {
  final Model model;
  const ModelSuccess(this.model);
  @override
  List<Object> get props => [model];
}

class ModelFailure extends ModelState {
  final Failure failure;
  const ModelFailure(this.failure);
}
