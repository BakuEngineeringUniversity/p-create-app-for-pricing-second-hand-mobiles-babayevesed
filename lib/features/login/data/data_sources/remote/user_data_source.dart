import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telefonchu/features/login/data/models/user_model.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<UserEntity> createUser(UserEntity user);
  Future<UserEntity> login(String email, String password);
}

class UserDataSourceImpl extends UserDataSource {
  final FirebaseFirestore firebaseFirestore;
   UserDataSourceImpl(this.firebaseFirestore);
   
  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final result =
        await firebaseFirestore.collection('users').add(UserModel.fromEntity(user).toMap());
    return UserModel.fromSnapshot(await result.get());
  }

  @override
  Future<UserEntity> login(String email, String password) async {
    final result = await firebaseFirestore
        .collection('users')
        .where(
          'email',
          isEqualTo: email,
        )
        .where(
          'password',
          isEqualTo: password,
        )
        .get();
    return UserModel.fromSnapshot(result.docs.first);
  }
}
