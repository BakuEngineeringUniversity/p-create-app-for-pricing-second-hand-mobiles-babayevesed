import 'dart:convert';

import 'package:telefonchu/features/models/domain/entities/price_entity.dart';

class PriceModel extends Price {
  const PriceModel({super.buyingPrice, super.sellingPrice});
  factory PriceModel.fromMap(Map<String, dynamic> map) {
    return PriceModel(
      buyingPrice: map['buying_price'],
      sellingPrice: map['selling_price'],
    );
  }
  factory PriceModel.fromEntity(Price price) {
    return PriceModel(
      buyingPrice: price.buyingPrice,
      sellingPrice: price.sellingPrice,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'buying_price': buyingPrice,
      'selling_price': sellingPrice,
    };
  }

  String toJson() => json.encode(toMap());

  factory PriceModel.fromJson(String source) => PriceModel.fromMap(json.decode(source));
}
