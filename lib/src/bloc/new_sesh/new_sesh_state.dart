part of 'new_sesh_bloc.dart';

enum NewSeshStatus { initial, loading, success, failure }

class NewSeshState extends Equatable {
  const NewSeshState({
    this.sesh = Sesh.empty,
    required this.user,
    this.status = NewSeshStatus.success,
  });

  final Sesh sesh;
  final UserModel user;
  final NewSeshStatus status;


  NewSeshState copyWith({
    Sesh Function()? sesh,
    UserModel Function()? user,
    NewSeshStatus Function()? status,
  }) {
    return NewSeshState(
      sesh: sesh != null ? sesh() : this.sesh,
      user: user != null ? user() : this.user,
      status: status != null ? status() : this.status,
    );
  }

  @override
  List<Object> get props => [sesh, status, user];
}
