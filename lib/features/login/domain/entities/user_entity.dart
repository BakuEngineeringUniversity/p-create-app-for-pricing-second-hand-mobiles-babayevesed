import 'package:equatable/equatable.dart';

 class UserEntity extends Equatable {
  final String? id;
  final String? docId;
  final String? name;
  final String? email;
  final String? password;
  final bool? isAdmin;
  const UserEntity({
    this.id,
    this.docId,
    this.name,
    this.email,
    this.password,
    this.isAdmin,
  });
   

  @override
  List<Object?> get props => [id, docId, name, email, password, isAdmin];
}
