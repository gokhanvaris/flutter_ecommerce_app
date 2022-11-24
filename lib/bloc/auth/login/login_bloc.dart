import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ecommerce_app/data/network/repository/auth_repository.dart';

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
      final login = await _authRepository.login();
      emit(LoginSuccessState());
    } catch (e) {
      emit(LoginErrorState(error: e.toString()));
    }
  }
}
