
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:school_app/enums/tabs_enum.dart';

part 'main_state.dart';
part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc():super(MainState(selectedTab: TabsList.schoolHome.index)) {
     on((TabChanged event, Emitter<MainState> emit) => emit(state.copyWith(selectedTab:event.selectedTab)));
  }

  Stream<MainState> mapEventToState(MainEvent event) async* {
    if(event is TabChanged) {
      on((TabChanged event, Emitter<MainState> emit) => emit(state.copyWith(selectedTab:event.selectedTab)));
    }
  }
}