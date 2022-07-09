part of 'newClimb_bloc.dart';

abstract class NewClimbEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewClimbRequested extends NewClimbEvent {
 
}

class CreatingNewClimbRequested extends NewClimbEvent {
}

class SavingNewClimbRequested extends NewClimbEvent {}