part of 'newClimb_bloc.dart';

abstract class NewClimbState extends Equatable {}

class NewClimbLoading extends NewClimbState {
  @override
  List<Object?> get props => [];
}

class NewClimbInitial extends NewClimbState {
  final Climb climb;

  NewClimbInitial(this.climb);

  @override
  List<Object?> get props => [climb];
}

// class NewClimbWorking extends NewClimbState {
//   final Climb currClimb;

//   NewClimbWorking(this.currClimb);

//   @override
//   List<Object?> get props => [currClimb];
// } 

class NewClimbCreated extends NewClimbState {

  @override
  List<Object?> get props => [];
}

class NewClimbError extends NewClimbState {
  @override
  List<Object?> get props => [];
}