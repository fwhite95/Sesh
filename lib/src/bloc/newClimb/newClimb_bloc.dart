import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:equatable/equatable.dart';

part 'newClimb_event.dart';
part 'newClimb_state.dart';

class NewClimbBloc extends Bloc<NewClimbEvent, NewClimbState> {
  final SeshRepository seshRepository;

  NewClimbBloc({required this.seshRepository}) : super(NewClimbInitial(Climb())) {
    on<CreatingNewClimbRequested>((event, emit) {
      emit(NewClimbLoading());
      
      print('on<CreatingNewClimbRequested>');
      emit(NewClimbCreated());
    });

    on<NewClimbRequested>((event, emit) {
      emit(NewClimbLoading());

      print('on<NewClimbRequested>');
      emit(NewClimbInitial(new Climb()));
    });

    on<IncNewClimbGradeRequested>((event, emit) {
      emit(NewClimbLoading());

      event.climb.grade = event.climb.grade! + 1;
      emit(NewClimbInitial(event.climb));
    });

    on<DecNewClimbGradeRequested>((event, emit) {
      emit(NewClimbLoading());

      event.climb.grade = event.climb.grade! - 1;
      emit(NewClimbInitial(event.climb));
    });

    on<IncNewClimbAttemptsRequested>((event, emit) {
      emit(NewClimbLoading());

      event.climb.attempts = event.climb.attempts! + 1;
      emit(NewClimbInitial(event.climb));
    });

    on<DecNewClimbAttemptsRequested>((event, emit) {
      emit(NewClimbLoading());

      event.climb.attempts = event.climb.attempts! - 1;
      emit(NewClimbInitial(event.climb));
    });
  }
}