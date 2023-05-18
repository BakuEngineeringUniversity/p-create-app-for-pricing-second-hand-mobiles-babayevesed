import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final double? sellingPrice;
  final double? buyingPrice;
  const Price({this.buyingPrice, this.sellingPrice});

  @override
  List<Object?> get props => [sellingPrice, buyingPrice];
}
