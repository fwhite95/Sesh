import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sesh_detail_event.dart';
part 'sesh_detail_state.dart';

class SeshDetailBloc extends Bloc<SeshDetailEvent, SeshDetailState> {
  SeshDetailBloc() : super(SeshDetailInitial()) {
    on<SeshDetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
