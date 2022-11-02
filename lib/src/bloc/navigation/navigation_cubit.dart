import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void getNavStatus(NavigationStatus status) {
    switch (status) {
      case NavigationStatus.home:
        emit(state.copyWith(status: NavigationStatus.home, index: 0));
        break;
      case NavigationStatus.sesh:
        emit(state.copyWith(status: NavigationStatus.sesh, index: 1));
        break;
      case NavigationStatus.newSesh:
        emit(state.copyWith(status: NavigationStatus.newSesh, index: 2));
        break;
      case NavigationStatus.settings:
        emit(state.copyWith(status: NavigationStatus.settings, index: 3));
        break;
      case NavigationStatus.stats:
        emit(state.copyWith(status: NavigationStatus.stats, index: 4));
        break;
    }
  }
}
