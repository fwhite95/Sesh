import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repositories/auth_repository.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sesh_event.dart';
part 'sesh_state.dart';

class SeshBloc extends Bloc<SeshEvent, SeshState> {
  final SeshRepository seshRepository;

  SeshBloc({required this.seshRepository}) : super(SeshInitial()) {
    on<SeshesRequested>((event, emit) async {
      emit(Loading());
      try{
        UserModel userModel = await seshRepository.getUser(userId: event.userId);
        emit(Browsing(userModel));
      }catch(e) {
        emit(SeshError(e.toString()));
      }
    });
    on<CreateUserRequested>((event, emit) async {
      emit(Loading());
      try{
        UserModel? userModel = await seshRepository.createUser(email: event.email, firstName: event.firstName, uid: event.uuid);
        emit(Browsing(userModel!));
      }catch(e) {
        emit(SeshError(e.toString()));
      }
    });
    // on<CreateNewSeshRequested>((event, emit) {

    // });
  }
}
