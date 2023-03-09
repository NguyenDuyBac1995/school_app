part of'login_bloc.dart';

@immutable
class LoginState extends Equatable{
  const LoginState({
    this.password = '',
    this.username = '',
    this.passwordVisible = false,
});
  final String username;
  final String password;
  final bool passwordVisible;

  LoginState changeWith({
    String? username,
    String? password,
    bool? passwordVisible,
}){
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      passwordVisible: passwordVisible ?? this.passwordVisible
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [username,password,passwordVisible];
}