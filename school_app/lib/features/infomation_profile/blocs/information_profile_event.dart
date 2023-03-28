part of 'information_profile_bloc.dart';

class InformationProfileEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetInformation extends InformationProfileEvent{
  final String? username;
  final String? password;
  GetInformation({this.username, this.password});
  @override
  List<Object?> get props => [username, password];
}