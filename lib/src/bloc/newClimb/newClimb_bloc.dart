import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:equatable/equatable.dart';

part 'newClimb_event.dart';
part 'newClimb_state.dart';

class NewClimbBloc extends Bloc<NewClimbEvent, NewClimbState> {
  final SeshRepository seshRepository;

  NewClimbBloc({required this.seshRepository}) : super(NewClimbInitial()) {
    on<CreatingNewClimbRequested>((event, emit) {
      emit(NewClimbLoading());
      
      print('on<CreatingNewClimbRequested>');
      emit(NewClimbCreated());
    });
  }
}