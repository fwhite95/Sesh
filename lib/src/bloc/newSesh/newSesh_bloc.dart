import 'package:bloc/bloc.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'newSesh_event.dart';
part 'newSesh_state.dart';

class NewSeshBloc extends Bloc<NewSeshEvent, NewSeshState> {
  final SeshRepository seshRepository;

  NewSeshBloc({required this.seshRepository}) : super(NewSeshInitial()) {
    on<CreatingNewSeshRequested>((event, emit) {
      emit(NewSeshLoading());
      event.userModel.seshes?.add(Sesh());
      print('on<CreatingNewSeshRequested>');
      dev.log(event.userModel.toString());
      emit(NewSeshCreated(event.userModel));
    });

    on<NewSeshRequested>((event, emit) {
      emit(NewSeshLoading());
      print('on<NewSeshRequested>');
      dev.log(event.userModel.toString());
      emit(NewSeshInitial());
    });
  }
}