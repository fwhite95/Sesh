part of 'sesh_card_bloc.dart';

enum SeshCardStatus { initial, loading, success, failure}

class SeshCardState extends Equatable {
  const SeshCardState({
    this.status = SeshCardStatus.initial,
    required this.user,
    required this.sesh,
  });

  final SeshCardStatus status;
  final UserModel user;
  final Sesh sesh;

  SeshCardState copyWith({
    SeshCardStatus Function()? status,
    UserModel Function()? user,
    Sesh Function()? sesh,
  }) {
    return SeshCardState(
      status: status != null ? status() : this.status,
      user: user != null ? user() : this.user, 
      sesh: sesh != null ? sesh() : this.sesh
      );
  }
  
  @override
  List<Object> get props => [status, user, sesh];
}
