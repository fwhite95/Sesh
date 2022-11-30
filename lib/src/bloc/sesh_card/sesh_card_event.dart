part of 'sesh_card_bloc.dart';

abstract class SeshCardEvent extends Equatable {
  const SeshCardEvent();

  @override
  List<Object> get props => [];
}

class SeshCardDeleteSesh extends SeshCardEvent {
  const SeshCardDeleteSesh(this.user, this.sesh);

  final UserModel user;
  final Sesh sesh;

  @override
  List<Object> get props => [user, sesh];
}
