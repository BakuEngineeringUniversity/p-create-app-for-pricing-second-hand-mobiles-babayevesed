import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({super.docId, super.email, super.id, super.isAdmin, super.name, super.password});
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'],
        id: map['id'],
        docId: map['doc_id'],
        isAdmin: map['is_admin'],
        email: map['email'],
        password: map['password']);
  }
 
  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
        name: data['name'],
        id: data['id'],
        docId: doc.id,
        isAdmin: data['is_admin'],
        email: data['email'],
        password: data['password']);
  }
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
        name: userEntity.name,
        id: userEntity.id,
        docId: userEntity.docId,
        email: userEntity.email,
        password: userEntity.password,
        isAdmin: userEntity.isAdmin);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'email': email,
      'password': password,
      'is_admin': isAdmin,
    };
  }

  UserModel copyWith({
    String? name,
    String? id,
    String? docId,
    String? email,
    String? password,
    bool? isAdmin,
  }) {
    return UserModel(
        name: name ?? this.name,
        id: id ?? this.id,
        docId: docId ?? this.docId,
        email: email ?? this.email,
        password: password ?? this.password,
        isAdmin: isAdmin ?? this.isAdmin);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
