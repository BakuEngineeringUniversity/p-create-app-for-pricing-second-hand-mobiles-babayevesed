part of 'delete_brand_cubit.dart';

abstract class DeleteBrandState extends Equatable {
  const DeleteBrandState();

  @override
  List<Object> get props => [];
}

class DeleteBrandInitial extends DeleteBrandState {}

class DeleteBrandLoading extends DeleteBrandState {}

class DeleteBrandSuccess extends DeleteBrandState {
  const DeleteBrandSuccess();
}

class DeleteBrandFailure extends DeleteBrandState {
  final Failure failure;
  const DeleteBrandFailure(this.failure);
}
