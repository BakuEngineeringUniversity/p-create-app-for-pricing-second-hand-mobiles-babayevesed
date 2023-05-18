part of 'models_cubit.dart';

abstract class ModelsState extends Equatable {
  const ModelsState();

  @override
  List<Object> get props => [];
}

class ModelsInitial extends ModelsState {}

class ModelsInProgress extends ModelsState {}

class ModelsSuccess extends ModelsState {
  final List<Model> models;
  const ModelsSuccess(this.models);
}

class ModelsFailure extends ModelsState {
  final Failure failure;
  const ModelsFailure(this.failure);
}
