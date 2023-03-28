import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:school_app/core/services/student_service.dart';
import 'package:school_app/core/services/teacher_service.dart';

part 'information_profile_event.dart';
part 'information_profile_state.dart';

class InformationProfileBloc extends Bloc<InformationProfileEvent,InformationProfileState>{
  InformationProfileBloc():super( const InformationProfileState()){
    on<GetInformation>(_onInformation);
  }
  void _onInformation(GetInformation  event, Emitter<InformationProfileState> emit)async{
    try{
      final dataStudent = await StudentServices().getStudentData();
      final dataTeacher = await TeacherServices().getTeacherData();
      var listInformation = [];
      for(int i = 0;i<dataStudent.length;i++){
       if(dataStudent[i].userName==event.username&&dataStudent[i].password == event.password){
         listInformation.add(dataStudent[i]);
       }
      }
      for(int i=0;i<dataTeacher.length;i++){
        if(dataTeacher[i].userName==event.username&&dataTeacher[i].password==event.password){
          listInformation.add(dataTeacher[i]);
        }
      }
      // listInformation.add(dataStudent.where((e) => e.userName == event.username&&e.password==event.password).toList());
      // listInformation.add(dataTeacher.where((e) => e.userName == event.username&&e.password==event.password).toList());
      emit(state.copyWith(loading: false,information: listInformation));
    }catch(e){
      emit(state.copyWith(error: e.toString()));
    }
  }
}