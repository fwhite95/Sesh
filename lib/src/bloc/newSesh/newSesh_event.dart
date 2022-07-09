part of 'newSesh_bloc.dart';

abstract class NewSeshEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewSeshRequested extends NewSeshEvent {
  final UserModel userModel;

  NewSeshRequested(this.userModel);
}

class CreatingNewSeshRequested extends NewSeshEvent {
  final UserModel userModel;

  CreatingNewSeshRequested(this.userModel);
}

class SavingNewSeshRequested extends NewSeshEvent {}