part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override 
  List<Object> get props => [];
}

class AppLogoutRequested extends AppEvent {}

class AppNavToSeshPageRequested extends AppEvent {
  const AppNavToSeshPageRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class AppNavToHomePageRequested extends AppEvent {
  const AppNavToHomePageRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class AppNavToNewSeshPageRequested extends AppEvent {
  const AppNavToNewSeshPageRequested(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}

class AppUserChanged extends AppEvent {
  @visibleForTesting
  const AppUserChanged(this.user);

  final UserModel user;

  @override
  List<Object> get props => [user];
}