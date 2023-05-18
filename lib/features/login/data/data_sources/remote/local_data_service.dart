import 'package:shared_preferences/shared_preferences.dart';
import 'package:telefonchu/features/login/data/models/user_model.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';

abstract class UserLocalDataSource {
  Future<void> saveUser(UserEntity entity);
  UserEntity getUser();
  Future<void> logOut();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences preferences;
  UserLocalDataSourceImpl(this.preferences);

  @override
  Future<void> saveUser(UserEntity entity) async {
    await preferences.setString('user', UserModel.fromEntity(entity).toJson());
  }

  @override
  UserEntity getUser() {
    final result = UserModel.fromJson(preferences.getString('user')!);
    return result;
  }

  @override
  Future<void> logOut() async {
    await preferences.remove('user');
  }
}
