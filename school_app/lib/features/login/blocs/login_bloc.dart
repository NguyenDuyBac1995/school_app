import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(const LoginState()){
    on<LoginUsernameChanged>((event, emit)
    => emit(state.changeWith(username: event.username)));
    on<LoginPasswordChanged>((event, emit)
    => emit(state.changeWith(password: event.password)));
    on<TogglePasswordStatusChanged>((event, emit)
    => emit(state.changeWith(passwordVisible: !state.passwordVisible)));
  }
}