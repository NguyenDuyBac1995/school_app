import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/core/services/student_service.dart';

part 'home_event.dart';
part 'home_state.dart';
class HomeBloc extends Bloc<HomeEvent,HomeState>{
 HomeBloc():super(const HomeState()){
  on<GetTeacherHomeData>(_onGetData);
 }


 void _onGetData(GetTeacherHomeData event ,Emitter<HomeState> emit)async{
  try{
   final data = await StudentServices().getStudentData();
   var listClass = [];
   for(int i = 0;i < data.length; i++){
    if(!listClass.contains(data[i].className)){
     listClass.add(data[i].className);
    }
   }
   var listStudentClass = [];
   for(int i = 0; i < listClass.length; i++){
    listStudentClass.add(data.where((element) => element.className == listClass[i]).toList());
   }
   emit(state.copyWith(loading: false,listClass: listClass,listStudentClass: listStudentClass ));
  }catch(e){
   emit(state.copyWith(error: e.toString()));
  }
 }
// @override
//  Stream<HomeState> mapEventToState(HomeEvent event) async*{
//  if(event is GetHomeData){
//   yield HomeLoading();
//   try {
//    final data = _studentServices.getStudentData();
//    yield HomeSuccess(data);
//   }catch(e){
//    yield HomeFailure(e.toString());
//   }
//  }
// }
// }
}