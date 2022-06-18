part of 'auth_bloc.dart';


abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// When the user presses the signin or signup button the 
//state is changed to loading first and then to Authenticated.
class Loading extends AuthState {
  @override 
  List<Object?> get props => [];
}

// // When the user is authenticated the state is changed to 
// // Authenticated.
class Authenticated extends AuthState {
  final String? uuid;

  const Authenticated(this.uuid);

  @override 
  List<Object?> get props => [uuid];
}

class CreatingUser extends AuthState {
  final String name;
  final String email;
  final String? uuid;

  const CreatingUser(this.name, this.email, this.uuid);

  @override 
  List<Object?> get props => [name, email, uuid];
}

// // This is the initial state of the bloc. When the user 
// //is not authenticated the state is changed to Unauthenticated.
class UnAuthenticated extends AuthState {
  @override 
  List<Object?> get props => [];
}

// //If any error occurs the state is changed to AuthError
class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override 
  List<Object?> get props => [error];
}