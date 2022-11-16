part of 'sesh_bloc.dart';

@immutable
abstract class SeshEvent extends Equatable {
  const SeshEvent();

  @override
  List<Object> get props => [];
}

class SeshUserSubscriptionRequested extends SeshEvent {
  const SeshUserSubscriptionRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class SeshDeleteSesh extends SeshEvent {
  const SeshDeleteSesh(this.user, this.sesh);

  final UserModel user;
  final Sesh sesh;

  @override
  List<Object> get props => [user, sesh];
}


