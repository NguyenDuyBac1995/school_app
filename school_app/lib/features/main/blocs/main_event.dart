part of 'main_bloc.dart';
@immutable
abstract class MainEvent extends Equatable {
  @override
  List<Object> get props => [];
}
@immutable
class TabChanged extends MainEvent {
  final int selectedTab;
  TabChanged({required this.selectedTab});
  @override
  List<Object> get props => [selectedTab];
}
