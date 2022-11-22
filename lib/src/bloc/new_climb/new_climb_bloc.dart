import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'new_climb_event.dart';
part 'new_climb_state.dart';

class NewClimbBloc extends Bloc<NewClimbEvent, NewClimbState> {
  NewClimbBloc({
    required Climb initialClimb,
  }) : super(NewClimbState(climb: initialClimb)) {
    on<NewClimbUpdateGradeRequested>(_onGradeChanged);
    on<NewClimbUpdateAttemptsRequested>(_onAttemptsChanged);
    on<NewClimbUpdateCompletedRequested>(_onCompletedChanged);
  }

  void _onGradeChanged(
    NewClimbUpdateGradeRequested event,
    Emitter<NewClimbState> emit,
  ) {
    emit(state.copyWith(status: () => NewClimbStatus.loading));
    
    emit(state.copyWith(
      status: () => NewClimbStatus.success,
      climb: () => Climb(
        climbId: state.climb.climbId,
        attempts: state.climb.attempts,
        grade: event.grade,
        completed: state.climb.completed,
        note: state.climb.note,
      ),
    ));
  }

  void _onAttemptsChanged(
    NewClimbUpdateAttemptsRequested event,
    Emitter<NewClimbState> emit,
  ) {
    emit(state.copyWith(status: () => NewClimbStatus.loading));
    
    emit(state.copyWith(
      status: () => NewClimbStatus.success,
      climb: () => Climb(
        climbId: state.climb.climbId,
        attempts: event.attempts,
        grade: state.climb.grade,
        completed: state.climb.completed,
        note: state.climb.note,
      ),
    ));
  }

  void _onCompletedChanged(
    NewClimbUpdateCompletedRequested event,
    Emitter<NewClimbState> emit,
  ) {
    emit(state.copyWith(status: () => NewClimbStatus.loading));
    
    emit(state.copyWith(
      status: () => NewClimbStatus.success,
      climb: () => Climb(
        climbId: state.climb.climbId,
        attempts: state.climb.attempts,
        grade: state.climb.grade,
        completed: event.completed,
        note: state.climb.note,
      ),
    ));
  }
}
