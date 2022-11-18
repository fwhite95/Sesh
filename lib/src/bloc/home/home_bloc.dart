import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required UserFbRepository userFbRepository,
    required UserModel user
  })  : _userFbRepository = userFbRepository,
        super(HomeState(user: user)) {
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
    on<HomeCreateUserRequested>(_createFbUser);
  }

  final UserFbRepository _userFbRepository;

  Future<void> _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: () => HomeStatus.loading));

    await emit.forEach<UserModel>(
      _userFbRepository.getUser(event.user.userId!),
      onData: (user) => state.copyWith(
        status: () => HomeStatus.success,
        user: () => user,
      ),
      onError: (_, __) => state.copyWith(
        status: () => HomeStatus.failure,
      ),
    );
  }

  /// Create user for firestore from [UserFbRepository]
  Future<void> _createFbUser(
    HomeCreateUserRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: () => HomeStatus.loading));
    try {
      if (await _userFbRepository.doesUserExist(event.user)) {
        print('THIS IS BAD');
        await _userFbRepository.createFirebaseUser(event.user);
      }

      emit(state.copyWith(
        status: () => HomeStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: () => HomeStatus.failure));
    }
  }
}
