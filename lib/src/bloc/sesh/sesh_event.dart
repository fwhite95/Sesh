part of 'sesh_bloc.dart';

abstract class SeshEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateUserRequested extends SeshEvent {
  final String? firstName;
  final String? email;
  final String? uuid;

  CreateUserRequested(this.firstName, this.email, this.uuid);
}

class CreateSeshRequested extends SeshEvent {}

class CreateClimbRequested extends SeshEvent {}

class SeshesRequested extends SeshEvent {
  final String? userId;

  SeshesRequested(this.userId);
}

// class CreateNewSeshRequested extends SeshEvent {
//   final UserModel userModel;
//   //other option
//   // List<Sesh> seshList;

//   CreateNewSeshRequested(this.userModel);
// }