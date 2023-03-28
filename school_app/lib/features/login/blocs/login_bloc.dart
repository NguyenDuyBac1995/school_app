import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:school_app/core/models/student_model.dart';
import 'package:school_app/core/models/teacher_model.dart';
import 'package:school_app/core/services/student_service.dart';
import 'package:school_app/core/services/teacher_service.dart';

part 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginChanged>(_onLoginChanged);
    on<TogglePasswordStatusChanged>(_togglePasswordStatusChanged);
  }

  void _onLoginChanged(LoginChanged event, Emitter<LoginState> emit) async {
    try {
      final dataStudent = await StudentServices().getStudentData();
      final dataTeacher = await TeacherServices().getTeacherData();
      int index = dataStudent
          .where((element) =>
              element.userName == event.username &&
              element.password == event.password)
          .toList()
          .length;
      int index2 = dataTeacher
          .where((element) =>
              element.userName == event.username &&
              element.password == event.password)
          .toList()
          .length;
      bool checkUsername = false;
      for(int i= 0; i<dataStudent.length;i++){
        if (dataStudent[i].userName == event.username){
          checkUsername = true;
        }
      }
      for(int i= 0; i<dataTeacher.length;i++){
        if(dataTeacher[i].userName == event.username){
          checkUsername = true;
        }
      }
      if(checkUsername == false){
        emit(state.changeWith(usernameError: true,passwordError: true, loading:  false));
      }else if (index > 0) {
        emit(state.changeWith(
            listStudent: dataStudent, selectedRoad: 1, loading: false));
      } else if (index2 > 0) {
        emit(state.changeWith(
            listStudent: dataStudent,
            listTeacher: dataTeacher,
            selectedRoad: 2,
            loading: false));
      } else {
        emit(state.changeWith(passwordError:true, loading: false));
      }
    } catch (e) {
      emit(state.changeWith(error: e.toString()));
    }
  }

  void _togglePasswordStatusChanged(
      TogglePasswordStatusChanged event, Emitter<LoginState> emit) {
    emit(state.changeWith(passwordVisible: !state.passwordVisible));
  }
}
