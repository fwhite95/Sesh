import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/repositories/auth_repository.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';


part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final SeshRepository seshRepository;

  AuthBloc({required this.authRepository, required this.seshRepository})
      : super(UnAuthenticated()) {
    // When User Presses the SignIn Button, we will send the
    //SignInRequested Event to the AuthBloc to handle it and
    //emit the Authenticated State if the user is authenticated
    on<SignInRequested>((event, emit) async {
      emit(Loading());
      try {
        UserCredential? userCredential = await authRepository.signIn(
            email: event.email, password: event.password);
        emit(Authenticated(userCredential?.user?.uid));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });
    // When User Presses the SignUp Button, we will send the
    //SignUpRequest Event to the AuthBloc to handle it and
    //emit the Authenticated State if the user is authenticated
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        UserCredential? userCredential = await authRepository.signUp(
            name: event.name, email: event.email, password: event.password);
        emit(Authenticated(userCredential?.user?.uid));
        emit(CreatingUser(event.name, event.email, userCredential?.user?.uid));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    // When User Presses the SignOut Button, we will send the
    //SignOutRequested Event to the AuthBloc to handle it and
    //emit the UnAuthenticated State
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
