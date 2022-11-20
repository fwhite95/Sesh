part of 'new_sesh_bloc.dart';

@immutable
abstract class NewSeshEvent extends Equatable {
  const NewSeshEvent();

  @override
  List<Object> get props => [];
}

class NewSeshStarted extends NewSeshEvent {}

class NewSeshCreateClimbRequested extends NewSeshEvent {}

class NewSeshDeleteClimbRequested extends NewSeshEvent {}

class NewSeshUpdateClimbAttemptsRequested extends NewSeshEvent {
  const NewSeshUpdateClimbAttemptsRequested(this.climb);

  final Climb climb;

  @override
  List<Object> get props => [climb];
}

class NewSeshSaveSeshRequested extends NewSeshEvent {
  const NewSeshSaveSeshRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}


