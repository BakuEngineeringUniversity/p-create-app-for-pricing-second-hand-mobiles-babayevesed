part of 'add_model_cubit.dart';

abstract class AddModelState extends Equatable {
  const AddModelState();

  @override
  List<Object> get props => [];
}

class AddModelInitial extends AddModelState {}

class AddModelInProgress extends AddModelState {}

class AddModelSuccess extends AddModelState {
  final Model model;
  const AddModelSuccess(this.model);
}

class AddModelFailure extends AddModelState {
  final Failure failure;
  const AddModelFailure(this.failure);
}
