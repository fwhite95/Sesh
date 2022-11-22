import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../models/user_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    on<AppNavToSeshPageRequested>(_onNavToSeshPageRequested);
    on<AppNavToHomePageRequested>(_onNavToHomePageRequested);
    on<AppNavToNewSeshPageRequested>(_onNavToNewSeshPageRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<UserModel> _userSubscription;

  void _onUserChanged(AppUserChanged event, Emitter<AppState> emit) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  void _onNavToSeshPageRequested(
      AppNavToSeshPageRequested event, Emitter<AppState> emit) {
    emit(AppState._(status: AppStatus.sesh, user: event.user));
  }

  void _onNavToHomePageRequested(
      AppNavToHomePageRequested event, Emitter<AppState> emit) {
    emit(AppState._(status: AppStatus.home, user: event.user));
  }

  void _onNavToNewSeshPageRequested(
      AppNavToNewSeshPageRequested event, Emitter<AppState> emit) {
    emit(AppState._(status: AppStatus.newSesh, user: event.user));
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
