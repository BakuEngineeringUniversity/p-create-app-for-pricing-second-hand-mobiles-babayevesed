import 'package:equatable/equatable.dart';

class UserDto extends Equatable {
  final String email;
  final String password;
  const UserDto(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
