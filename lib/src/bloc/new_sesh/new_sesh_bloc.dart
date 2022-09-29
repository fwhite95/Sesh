import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_sesh_event.dart';
part 'new_sesh_state.dart';

class NewSeshBloc extends Bloc<NewSeshEvent, NewSeshState> {
  NewSeshBloc() : super(NewSeshInitial()) {
    on<NewSeshEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
