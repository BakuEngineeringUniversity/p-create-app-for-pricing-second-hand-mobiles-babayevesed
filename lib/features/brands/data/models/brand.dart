import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/brands/domain/entities/brand_entity.dart';

class BrandModel extends Brand {
  const BrandModel({super.name, super.id, super.docId});
  factory BrandModel.fromMap(Map<String, dynamic> map) {
    return BrandModel(name: map['name'], id: map['id']);
  }
  factory BrandModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BrandModel(name: data['name'], id: data['id'], docId: doc.id);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  BrandModel copyWith({
    String? name,
    String? id,
    String? docId,
  }) {
    return BrandModel(
      name: name ?? this.name,
      id: id ?? this.id,
      docId: docId ?? this.docId,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandModel.fromJson(String source) => BrandModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [name, id];
}

final brand = FirebaseFirestore.instance.collection('brand');
