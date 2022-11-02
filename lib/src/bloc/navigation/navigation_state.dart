part of 'navigation_cubit.dart';

enum NavigationStatus { home, sesh, newSesh, settings, stats }

class NavigationState extends Equatable {
  const NavigationState({
    this.status = NavigationStatus.home,
    this.index = 0,
  });

  final NavigationStatus status;
  final int index;

  @override
  List<Object> get props => [status, index];

  NavigationState copyWith({
    NavigationStatus? status,
    int? index,
  }) {
    return NavigationState(
      status: status ?? this.status,
      index: index ?? this.index,
    );
  }
}
