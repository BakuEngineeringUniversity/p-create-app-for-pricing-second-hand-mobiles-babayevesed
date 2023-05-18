import 'dart:convert';

import 'package:telefonchu/features/models/data/models/price_mode.dart';
import 'package:telefonchu/features/models/domain/entities/option_entity.dart';

class ModelOptionModel extends ModelOption {
  const ModelOptionModel({super.id, super.price, super.storage});
  factory ModelOptionModel.fromMap(Map<String, dynamic> map) {
    return ModelOptionModel(
        price: map['price'] != null ? PriceModel.fromMap(map['price']) : null,
        storage: map['storage'],
        id: map['id']);
  }
  factory ModelOptionModel.fromEntity(ModelOption modelOption) {
    return ModelOptionModel(
        price: modelOption.price, storage: modelOption.storage, id: modelOption.id);
  }
  Map<String, dynamic> toMap() {
    return {
      'price': price != null ? PriceModel.fromEntity(price!).toMap() : null,
      'storage': storage,
      'id': id,
    };
  }

  String toJson() => json.encode(toMap());

  factory ModelOptionModel.fromJson(String source) => ModelOptionModel.fromMap(json.decode(source));
}
