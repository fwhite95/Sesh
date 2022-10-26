part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeSubscriptionRequested extends HomeEvent {
  const HomeSubscriptionRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class HomeCreateUserRequested extends HomeEvent {
  const HomeCreateUserRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}