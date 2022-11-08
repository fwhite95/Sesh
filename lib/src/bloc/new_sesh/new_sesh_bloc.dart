import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/pages/sesh/new_sesh_page.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
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
    ListQueue<Climb>? climbs = ListQueue<Climb>();
    state.sesh.climbs!.forEach((c) {
      climbs.add(c);
    });
    climbs.addFirst(Climb(
      climbId: climbs.length + 1
    ));
    

    emit(state.copyWith(
      status: () => NewSeshStatus.success,
      sesh: () => Sesh(
        id: state.sesh.id,
        dateTime: state.sesh.dateTime,
        seshLength: state.sesh.seshLength,
        climbs: climbs.toList(),
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
    emit(state.copyWith(status: () => NewSeshStatus.loading));
  }

  Future<void> _saveSesh(
    NewSeshSaveSeshRequested event,
    Emitter<NewSeshState> emit,
  ) async {
    emit(state.copyWith(status: () => NewSeshStatus.loading));
  }
}
