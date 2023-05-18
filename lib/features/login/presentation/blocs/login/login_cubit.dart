import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/core/errors/failure.dart';
import 'package:telefonchu/features/login/domain/entities/user_dto.dart';
import 'package:telefonchu/features/login/domain/entities/user_entity.dart';
import 'package:telefonchu/features/login/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.useCase) : super(LoginInitial());
  final LoginUseCase useCase;
  login(String email, String password) async {
    emit(LoginInProgress());
    final result = await useCase.call(UserDto(email, password));
    result.fold((failure) => emit(LoginFailure(failure)), (user) {
      return emit(LoginSuccess(user));
    });
  }
}
