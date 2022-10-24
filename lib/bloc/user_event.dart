part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetListUser extends UserEvent {}

class SearchListUser extends UserEvent {
  final String keyword;
  final String type;
  const SearchListUser(this.keyword, this.type);
  @override
  List<Object> get props => [keyword];
}

class PostListUser extends UserEvent {
  final UserGet userGet;
  const PostListUser(this.userGet);
  @override
  List<Object> get props => [userGet];
}
