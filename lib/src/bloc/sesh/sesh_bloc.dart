import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/sesh_model.dart';

part 'sesh_event.dart';
part 'sesh_state.dart';

class SeshBloc extends Bloc<SeshEvent, SeshState> {
  SeshBloc({
    required UserFbRepository userFbRepository,
    required UserModel user,
  })  : _userFbRepository = userFbRepository,
        super(SeshState(user: user)) {
    on<SeshUserSubscriptionRequested>(_onSubscriptionRequested);
    on<SeshDeleteSesh>(_deleteSesh);
  }

  final UserFbRepository _userFbRepository;

  Future<void> _onSubscriptionRequested(
    SeshUserSubscriptionRequested event,
    Emitter<SeshState> emit,
  ) async {
    emit(state.copyWith(status: () => SeshStatus.loading));

    await emit.forEach<UserModel>(
      _userFbRepository.getUser(event.user.userId!),
      onData: (user) => state.copyWith(
        status: () => SeshStatus.success,
        user: () => user,
      ),
      onError: (_, __) => state.copyWith(
        status: () => SeshStatus.failure,
      ),
    );
  }

  Future<void> _deleteSesh(
    SeshDeleteSesh event,
    Emitter<SeshState> emit,
  ) async {
    emit(state.copyWith(status: () => SeshStatus.loading));

    try {
      /// Uses !. because shouldnt be able to call delete
      /// without an existing sesh to remove
      event.user.seshes!.remove(event.sesh);
      await _userFbRepository.updateFirebaseUser(event.user);
    emit(state.copyWith(
        status: () => SeshStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: () => SeshStatus.failure));
    }
  }
}
