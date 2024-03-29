part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  @override 
  List<Object> get props => [];
}

// When the user signing in with email and password 
//this event is called and the [AuthRepository] is called to 
//sign in the user
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// // When the user signing up with email and password this 
// //event is called and the [AuthRepository] is called to sign 
// //up the user
class SignUpRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpRequested(this.name, this.email, this.password);
}

// class CreateUserRequested extends AuthEvent {
//   final String name;
//   final String email;
//   final String? uuid;

//   CreateUserRequested(this.name, this.email, this.uuid);
// }

// // When the user signing out this event is called and the 
// //[AuthRepository] is called to sign out the user
class SignOutRequested extends AuthEvent {} 