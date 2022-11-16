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
  }

  void _onGradeChanged(
    NewClimbUpdateGradeRequested event,
    Emitter<NewClimbState> emit,
  ) {
    emit(state.copyWith(status: () => NewClimbStatus.loading));
    print('from new climb bloc event.grade: ${event.grade}');
    
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
}
