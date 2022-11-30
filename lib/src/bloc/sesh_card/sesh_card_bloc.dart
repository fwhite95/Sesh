import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/sesh_model.dart';

part 'sesh_card_event.dart';
part 'sesh_card_state.dart';

class SeshCardBloc extends Bloc<SeshCardEvent, SeshCardState> {
  SeshCardBloc({
    required UserFbRepository userFbRepository,
    required UserModel user,
    required Sesh sesh,
  })  : _userFbRepository = userFbRepository,
        super(SeshCardState(user: user, sesh: sesh)) {
    on<SeshCardDeleteSesh>(_onDeleteSesh);
  }

  final UserFbRepository _userFbRepository;

  Future<void> _onDeleteSesh(
    SeshCardDeleteSesh event,
    Emitter<SeshCardState> emit,
  ) async {
    emit(state.copyWith(status: () => SeshCardStatus.loading));

    try {
      /// Uses !. because shouldnt be able to call delete
      /// without an existing sesh to remove
      event.user.seshes!.remove(event.sesh);
      await _userFbRepository.updateFirebaseUser(event.user);
      emit(state.copyWith(
        status: () => SeshCardStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(status: () => SeshCardStatus.failure));
    }
  }
}
