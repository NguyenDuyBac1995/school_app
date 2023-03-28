part of 'school_class_bloc.dart';

abstract class SchoolClassEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class ToggleLikeStatus extends SchoolClassEvent{
   ToggleLikeStatus({this.username});
   String? username;
  @override
  List<Object?> get props => [username,];
}

class CreatePostEvent extends SchoolClassEvent{
  BuildContext context;
 final PostModel? postNew;
  CreatePostEvent({this.postNew, required this.context});
  @override
  List<Object?> get props => [postNew];
}