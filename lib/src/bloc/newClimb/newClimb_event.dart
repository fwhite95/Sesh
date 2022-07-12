part of 'newClimb_bloc.dart';

abstract class NewClimbEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewClimbRequested extends NewClimbEvent {}

class CreatingNewClimbRequested extends NewClimbEvent {}

class SavingNewClimbRequested extends NewClimbEvent {}

class IncNewClimbGradeRequested extends NewClimbEvent {
  final Climb climb;

  IncNewClimbGradeRequested(this.climb);
}

class IncNewClimbAttemptsRequested extends NewClimbEvent {
  final Climb climb;

  IncNewClimbAttemptsRequested(this.climb);
}

class DecNewClimbGradeRequested extends NewClimbEvent {
  final Climb climb;

  DecNewClimbGradeRequested(this.climb);
}

class DecNewClimbAttemptsRequested extends NewClimbEvent {
  final Climb climb;

  DecNewClimbAttemptsRequested(this.climb);
}