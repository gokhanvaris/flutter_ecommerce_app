import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/network/repository/auth_repository.dart';
import '../../../models/login/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc
    extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }
  final AuthRepository _authRepository =
      AuthRepository();
  Future<FutureOr<void>> _onLoginEvent(
      LoginEvent event,
      Emitter<LoginState> emit) async {
    emit(LoginWaitingState());

    try {
      final login =
          await _authRepository.login(event.user);
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
