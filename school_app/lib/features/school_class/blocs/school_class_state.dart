part of 'school_class_bloc.dart';

class SchoolClassState extends Equatable {
 const SchoolClassState({this.listLike,this.toggleLike = false,this.listPost,this.loading = false});

  final List<String>? listLike ;
  final bool? toggleLike;
  final List<PostModel>? listPost;
  final bool? loading;

  SchoolClassState copyWith({
    List<String>? listLike,
    bool? toggleLike,
    List<PostModel>? listPost,
    bool? loading,
  }){
    return SchoolClassState(
      listLike: listLike??this.listLike,
      toggleLike: toggleLike??this.toggleLike,
      listPost: listPost??this.listPost,
      loading: loading??this.loading
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [listLike, toggleLike, listPost, loading];
}

class SchoolClassInitial extends SchoolClassState{}

class SchoolClassLoading extends SchoolClassState{}

class SchoolClassSuccess extends SchoolClassState{}

class SchoolClassFailed extends SchoolClassState{}