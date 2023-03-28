import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/post_model.dart';
import '../../../utilities/string.dart';

part 'school_class_event.dart';

part 'school_class_state.dart';

class SchoolClassBloc extends Bloc<SchoolClassEvent, SchoolClassState> {
  SchoolClassBloc()
      : super(SchoolClassState(listLike: [
          'Trần Văn Mạnh',
          'Nguyễn Thị Thu',
          'Hoàng Quốc Việt'
        ], listPost: [
          PostModel(
              name: 'Trần Văn Mạnh',
              avataStr:
                  "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/74.jpg",
              content: Strings.STATUS,
              listImage: [Strings.IMAGE,]),
          PostModel(
              name: 'Nguyễn Thị Thu',
              avataStr:
                  "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/58.jpg",
              content: Strings.STATUS,
              listImage: [
                Strings.IMAGE,
              ]),
          PostModel(
              name: 'Hoàng Quốc Việt',
              avataStr:
                  "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/69.jpg",
              content: Strings.STATUS,
              listImage: [
                Strings.IMAGE2,
              ])
        ])) {
    on<ToggleLikeStatus>(_onToggleLikeStatus);
    on<CreatePostEvent>(_onCreatePost);
  }

  void _onToggleLikeStatus(
      ToggleLikeStatus event, Emitter<SchoolClassState> emit) {
    List<String> listUserLike = state.listLike!;
    if (!listUserLike.contains(event.username)) {
      listUserLike.add(event.username!);
      emit(state.copyWith(listLike: listUserLike, toggleLike: true));
    } else {
      listUserLike.remove(event.username);
      emit(state.copyWith(listLike: listUserLike, toggleLike: false));
    }
  }

  _onCreatePost(
      CreatePostEvent event, Emitter<SchoolClassState> emit){
    emit(state.copyWith(loading: true));
    List<PostModel> listPostNew =
        getListPost(list: state.listPost, post: event.postNew);
    emit(state.copyWith(listPost: listPostNew, loading: false));
  }
}

getListPost({List<PostModel>? list, PostModel? post}) {
  list!.insert(0, post!);
  return list;
}
