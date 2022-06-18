part of 'sesh_bloc.dart';

abstract class SeshEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateSeshRequested extends SeshEvent {}

class CreateClimbRequested extends SeshEvent {}

class SeshesRequested extends SeshEvent {
  final String? userId;

  SeshesRequested(this.userId);
}