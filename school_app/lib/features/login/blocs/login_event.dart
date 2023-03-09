part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent{
  const LoginUsernameChanged(this.username);
  final String username;
}

class LoginPasswordChanged extends LoginEvent{
  const LoginPasswordChanged(this.password);
  final String password;
}

class TogglePasswordStatusChanged extends LoginEvent{
  const TogglePasswordStatusChanged();
}

class LoginSubmitted extends LoginEvent{
  const LoginSubmitted();
}