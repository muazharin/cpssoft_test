part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<UserGet> userGet;
  const UserLoaded(this.userGet);
}

class UserError extends UserState {
  final String message;
  const UserError(this.message);
}
