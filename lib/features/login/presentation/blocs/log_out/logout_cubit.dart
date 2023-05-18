import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:telefonchu/core/use_case/use_case.dart';
import 'package:telefonchu/features/login/domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._useCase) : super(LogoutInitial());
  final LogOutUseCase _useCase;

  logOut() async {
    final result = await _useCase.call(NoParams());
    result.fold((l) => emit(LogoutFailure()), (r) => emit(LogoutSuccess()));
  }
}
