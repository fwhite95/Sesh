import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/pages/sesh/new_sesh_page.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/sesh_model.dart';

part 'new_sesh_event.dart';
part 'new_sesh_state.dart';

class NewSeshBloc extends Bloc<NewSeshEvent, NewSeshState> {
  NewSeshBloc(
      {required UserFbRepository userFbRepository, required UserModel user})
      : _userFbRepository = userFbRepository,
        super(NewSeshState(user: user)) {
    on<NewSeshCreateClimbRequested>(_createClimb);
    on<NewSeshDeleteClimbRequested>(_deleteClimb);
    on<NewSeshUpdateClimbAttemptsRequested>(_updateClimb);
    on<NewSeshSaveSeshRequested>(_saveSesh);
  }

  final UserFbRepository _userFbRepository;

  Future<void> _createClimb(
    NewSeshCreateClimbRequested event,
    Emitter<NewSeshState> emit,
  ) async {
    emit(state.copyWith(status: () => NewSeshStatus.loading));
    List<Climb> climbs = [];
    state.sesh.climbs!.forEach((c) {
      climbs.add(c);
    });
    climbs.add(
        Climb(climbId: climbs.length + 1, grade: vGrade.first, attempts: 0));

    emit(state.copyWith(
      status: () => NewSeshStatus.success,
      sesh: () => Sesh(
        id: state.sesh.id,
        dateTime: state.sesh.dateTime,
        seshLength: state.sesh.seshLength,
        climbs: climbs,
      ),
    ));
  }

  Future<void> _deleteClimb(
    NewSeshDeleteClimbRequested event,
    Emitter<NewSeshState> emit,
  ) async {
    emit(state.copyWith(status: () => NewSeshStatus.loading));
  }

  Future<void> _updateClimb(
    NewSeshUpdateClimbAttemptsRequested event,
    Emitter<NewSeshState> emit,
  ) async {
    /// ToDo: not updating the correct climb because
    /// the climbId's from the list and the event do not
    /// match
    emit(state.copyWith(status: () => NewSeshStatus.loading));

    state.sesh.climbs!.forEach((c) {
      if (c.climbId == event.climb.climbId) {
        int i = state.sesh.climbs!.indexOf(c);
        state.sesh.climbs![i] = event.climb;
        //climbs.add(event.climb);
      }
    });
    //climbs.sort((a, b) => b.climbId!.compareTo(a.climbId!.toInt()));

    emit(state.copyWith(
      status: () => NewSeshStatus.success,
      sesh: () => Sesh(
        id: state.sesh.id,
        dateTime: state.sesh.dateTime,
        seshLength: state.sesh.seshLength,
        climbs: state.sesh.climbs,
      ),
    ));
  }

  Future<void> _saveSesh(
    NewSeshSaveSeshRequested event,
    Emitter<NewSeshState> emit,
  ) async {
    print('_saveSesh newSeshBloc');
    emit(state.copyWith(status: () => NewSeshStatus.loading));
    try {
      List<Sesh> seshList = [];
      state.user.seshes?.forEach((s) {
        seshList.add(s);
      });
      seshList.add(state.sesh);
      print('seshList: $seshList');
      state.copyWith(
        user: () => UserModel(
            email: state.user.email,
            firstName: state.user.firstName,
            userId: state.user.userId,
            seshes: seshList),
      );
      UserModel updatedUser = UserModel(
          email: state.user.email,
          firstName: state.user.firstName,
          userId: state.user.userId,
          seshes: seshList);

      print('newUserModel  ${updatedUser}');

      await _userFbRepository.updateFirebaseUser(updatedUser);
      emit(state.copyWith(
        status: () => NewSeshStatus.success,
        user: () => updatedUser
      ));
    } catch (_) {
      print(_.toString());
      emit(state.copyWith(
        status: () => NewSeshStatus.failure,
      ));
    }
  }
}
