import 'package:equatable/equatable.dart';

import 'package:telefonchu/features/models/domain/entities/price_entity.dart';

class ModelOption extends Equatable {
  const ModelOption({this.price, this.storage, this.id});
  final Price? price;
  final int? storage;
  final String? id;

  @override
  List<Object?> get props => [price, storage, id];
}
