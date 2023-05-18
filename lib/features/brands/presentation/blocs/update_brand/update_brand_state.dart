part of 'update_brand_cubit.dart';

abstract class UpdateBrandState extends Equatable {
  const UpdateBrandState();

  @override
  List<Object> get props => [];
}

class UpdateBrandInitial extends UpdateBrandState {}

class UpdateBrandLoading extends UpdateBrandState {}

class UpdateBrandSuccess extends UpdateBrandState {
  final BrandModel updatedBrand;
  const UpdateBrandSuccess(this.updatedBrand);
  @override
  List<Object> get props => [updatedBrand];
}

class UpdateBrandFailure extends UpdateBrandState {
  final Failure failure;
  const UpdateBrandFailure(this.failure);
}
