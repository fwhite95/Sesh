part of 'newSesh_bloc.dart';

abstract class NewSeshState extends Equatable {}

class NewSeshLoading extends NewSeshState {
  @override
  List<Object?> get props => [];
}

class NewSeshInitial extends NewSeshState {

  @override
  List<Object?> get props => [];
}

class NewSeshCreated extends NewSeshState {
  final UserModel userModel;

  NewSeshCreated(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class NewSeshError extends NewSeshState {
  @override
  List<Object?> get props => [];
}