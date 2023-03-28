part of 'information_profile_bloc.dart';

class InformationProfileState extends Equatable {
  final bool? loading;
  final String? error;
  final List? information;

  const InformationProfileState({this.error, this.loading = true, this.information});

  InformationProfileState copyWith({
    bool? loading,
    String? error,
    List? information,
  }) {
    return InformationProfileState(
      loading: loading,
      error: error,
      information: information
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [loading, error, information];
}
