part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginWaitingState extends LoginState {
  @override
  String toString() => 'LoginWaitingState';
}

class LoginSuccessState extends LoginState {
  @override
  String toString() => 'LoginSuccessState';
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
  @override
  String toString() => 'LoginErrorState';
}
