import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_climb_event.dart';
part 'new_climb_state.dart';

class NewClimbBloc extends Bloc<NewClimbEvent, NewClimbState> {
  NewClimbBloc() : super(NewClimbInitial()) {
    on<NewClimbEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
