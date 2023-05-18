import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/models/data/models/option.dart';
import 'package:telefonchu/features/models/domain/entities/model_entity.dart';
import '../../domain/entities/price_entity.dart';

class ModelModel extends Model {
  const ModelModel(
      {String? name,
      String? id,
      String? brandID,
      String? docId,
      List<ModelOptionModel>? modelOptions,
      List<String>? images})
      : super(
          name: name,
          id: id,
          brandID: brandID,
          docId: docId,
          images: images,
          modelOptions: modelOptions,
        );
  factory ModelModel.fromMap(Map<String, dynamic> map) {
    return ModelModel(
        name: map['name'],
        id: map['id'],
        brandID: map['brand_id'],
        images: map['images'],
        modelOptions: map['model_options'] != null
            ? (map['model_options'] as List).map((e) => ModelOptionModel.fromMap(e)).toList()
            : null);
  }
  factory ModelModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ModelModel(
      name: data['name'],
      id: data['id'],
      images: data['images'],
      modelOptions: data['model_options'] != null
          ? (data['model_options'] as List).map((e) => ModelOptionModel.fromMap(e)).toList()
          : null,
      brandID: data['brand_id'],
      docId: doc.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'images': images,
      'model_options': modelOptions?.map((e) => (e as ModelOptionModel).toMap()).toList(),
      'brand_id': brandID,
    };
  }

  ModelModel copyWith({
    String? name,
    String? id,
    String? brandID,
    String? docId,
    List<ModelOptionModel>? modelOptions,
    List<String>? images,
    Price? price,
  }) {
    return ModelModel(
      name: name ?? this.name,
      id: id ?? this.id,
      brandID: brandID ?? this.brandID,
      docId: docId ?? this.docId,
      images: images ?? this.images,
      modelOptions: modelOptions ??
          (this.modelOptions != null
              ? this.modelOptions!.map((e) => ModelOptionModel.fromEntity(e)).toList()
              : null),
    );
  }

  factory ModelModel.fromEntity(Model model) {
    return ModelModel(
        name: model.name,
        id: model.id,
        brandID: model.brandID,
        docId: model.docId,
        images: model.images,
        modelOptions: model.modelOptions != null
            ? model.modelOptions!.map((e) => ModelOptionModel.fromEntity(e)).toList()
            : null);
  }

  String toJson() => json.encode(toMap());

  factory ModelModel.fromJson(String source) => ModelModel.fromMap(json.decode(source));
}

final modelRef = FirebaseFirestore.instance.collection('model');
