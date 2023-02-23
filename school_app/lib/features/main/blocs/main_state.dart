
part of 'main_bloc.dart';
@immutable
class MainState extends Equatable {
    final int selectedTab;

    const MainState({required this.selectedTab});
    MainState copyWith(
            {var selectedTab}
        ) {
      return MainState(
        selectedTab: selectedTab
      );
    }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedTab];
}