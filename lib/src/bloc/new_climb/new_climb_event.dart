part of 'new_climb_bloc.dart';

@immutable
abstract class NewClimbEvent extends Equatable {
  const NewClimbEvent();

  @override
  List<Object> get props => [];
}

class NewClimbUpdateGradeRequested extends NewClimbEvent {
  const NewClimbUpdateGradeRequested(this.grade);

  final String grade;

  @override
  List<Object> get props => [grade];
}

class NewClimbUpdateAttemptsRequested extends NewClimbEvent {
  const NewClimbUpdateAttemptsRequested(this.attempts);

  final int attempts;

  @override
  List<Object> get props => [attempts];
}

class NewClimbUpdateNoteRequested extends NewClimbEvent {
  const NewClimbUpdateNoteRequested(this.note);

  final String note;

  @override
  List<Object> get props => [note];
}

class NewClimbUpdateCompletedRequested extends NewClimbEvent {
  const NewClimbUpdateCompletedRequested(this.completed);

  final bool completed;

  @override
  List<Object> get props => [completed];
}
