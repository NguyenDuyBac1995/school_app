part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  const LoginState({
    this.usernameError,
    this.passwordError,
    this.listStudent,
    this.listTeacher,
    this.selectedRoad,
    this.passwordVisible = false,
    this.loading = true,
    this.error,
  });

  final List<StudentModel>? listStudent;
  final List<TeacherModel>? listTeacher;
  final int? selectedRoad;
  final bool passwordVisible;
  final bool loading;
  final String? error;
  final bool? usernameError;
  final bool? passwordError;

  LoginState changeWith({
    List<StudentModel>? listStudent,
    List<TeacherModel>? listTeacher,
    int? selectedRoad,
    bool? passwordVisible,
    bool? loading,
    String? error,
    bool? usernameError,
    bool? passwordError,
  }) {
    return LoginState(
      listStudent: listStudent,
      listTeacher: listTeacher,
      selectedRoad: selectedRoad,
      passwordVisible: passwordVisible ?? this.passwordVisible,
      loading: loading ?? this.loading,
      error: error,
      usernameError: usernameError,
      passwordError: passwordError,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [listStudent, listTeacher, selectedRoad, passwordVisible,loading,error,usernameError,passwordError];
}
