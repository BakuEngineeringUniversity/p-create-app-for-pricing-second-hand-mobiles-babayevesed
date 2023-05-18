part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity user;
  const LoginSuccess(this.user);
}

class LoginFailure extends LoginState {
  final Failure failure;
  const LoginFailure(this.failure);
}
