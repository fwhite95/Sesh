part of 'sesh_bloc.dart';

enum SeshStatus { initial, loading, success, failure, navigate}

class SeshState extends Equatable {
  const SeshState({
    this.status = SeshStatus.initial,
    required this.user,
  });

  final SeshStatus status;
  final UserModel user;

  SeshState copyWith({
    SeshStatus Function()? status,
    UserModel Function()? user,
  }) {
    return SeshState(
      status: status != null ? status() : this.status,
      user: user != null ? user() : this.user,
    );
  }

  @override
  List<Object> get props => [status, user];
}
