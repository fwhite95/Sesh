import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_climb_state.dart';

class NewClimbCubit extends Cubit<NewClimbState> {
  NewClimbCubit() : super(NewClimbInitial());
}
