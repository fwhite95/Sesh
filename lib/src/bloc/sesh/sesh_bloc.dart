import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sesh_event.dart';
part 'sesh_state.dart';

class SeshBloc extends Bloc<SeshEvent, SeshState> {
  SeshBloc() : super(SeshInitial()) {
    on<SeshEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
