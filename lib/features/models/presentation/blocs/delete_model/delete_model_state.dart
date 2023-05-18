part of 'delete_model_cubit.dart';

abstract class DeleteModelState extends Equatable {
  const DeleteModelState();

  @override
  List<Object> get props => [];
}

class DeleteModelInitial extends DeleteModelState {}

class DeleteModelInProgress extends DeleteModelState {}

class DeleteModelSuccess extends DeleteModelState {}

class DeleteModelFailure extends DeleteModelState {
  final Failure failure;
  const DeleteModelFailure(this.failure);
}
