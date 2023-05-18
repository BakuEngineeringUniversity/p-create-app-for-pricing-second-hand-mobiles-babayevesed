part of 'brands_cubit.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object> get props => [];
}

class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsSuccess extends BrandsState {
  final List<BrandModel> brands;
  const BrandsSuccess(this.brands);
  @override
  List<Object> get props => [brands];
}

class BrandsFailure extends BrandsState {
  final Failure failure;
  const BrandsFailure(this.failure);
}
