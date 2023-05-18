part of 'add_brand_cubit.dart';

abstract class AddBrandState extends Equatable {
  const AddBrandState();

  @override
  List<Object> get props => [];
}

class AddBrandInitial extends AddBrandState {}

class AddBrandLoading extends AddBrandState {}

class AddBrandSuccess extends AddBrandState {
  final BrandModel brand;
  const AddBrandSuccess(this.brand);
  @override
  List<Object> get props => [brand];
}

class AddBrandFailure extends AddBrandState {
  final Failure failure;
  const AddBrandFailure(this.failure);
}
