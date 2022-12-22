part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  final User user;
  const LoginEvent(this.user);

  @override
  List<Object> get props => [user];
}
