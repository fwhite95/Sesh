part of 'sesh_bloc.dart';

abstract class SeshState extends Equatable {}

class Loading extends SeshState {
  @override
  List<Object?> get props => [];
}

class SeshInitial extends SeshState {
  @override
  List<Object?> get props => [];
}

class Browsing extends SeshState {
  final UserModel userModel;

  Browsing(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class CreatingSesh extends SeshState {
  @override
  List<Object?> get props => [];
}

class CreatingClimb extends SeshState {
  @override
  List<Object?> get props => [];
}

//If any error occurs the state is changed to SeshError
class SeshError extends SeshState {
  final String error;

  SeshError(this.error);

  @override
  List<Object?> get props => [error];
}
