// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
//
// part 'remind_event.dart';
// part 'remind_state.dart';
//
// class RemindBloc extends Bloc<RemindEvent, RemindState>{
//   RemindBloc():super(const RemindState()){
//    on<ToggleLikeStatus>(_onToggleLikeStatus);
//   }
//
//   void _onToggleLikeStatus(ToggleLikeStatus event, Emitter<RemindState> emit ){
//     List<String> listUserLike = [];
//     if(!listUserLike.contains(event.username)){
//       listUserLike.add(event.username!);
//       emit(state.copyWith(listLike: listUserLike,toggleLike: true));
//     }else{
//       listUserLike.remove(event.username);
//       emit(state.copyWith(listLike: listUserLike,toggleLike: false));
//     }
// }
// }