part of 'home_bloc.dart';
@immutable
class HomeState extends Equatable{
  const HomeState({
    this.loading = true,
    this.listStudentClass,
    this.listClass,
    this.error,
});
  final bool? loading;
  final List? listStudentClass;
  final List? listClass;
  final String? error;

  HomeState copyWith({
    bool? loading ,
    List? listStudentClass,
    List? listClass,
    String? error,
}){
    return HomeState(
      loading: loading,
      listStudentClass: listStudentClass,
      listClass: listClass,
      error: error
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [listStudentClass, error,loading, listClass];
}

// class HomeInitial extends HomeState{}
//
// class HomeLoading extends HomeState{
//
// }
//
// class HomeSuccess extends HomeState{
//   late final dynamic listStudentClass;
//
//   HomeSuccess(this.listStudentClass);
//
//   @override
//   List<Object?> get props => [listStudentClass];
// }
//
// class HomeFailure extends HomeState{
//   final String? error;
//   HomeFailure(this.error);
//   @override
//   List<Object?> get props => [error];
// }