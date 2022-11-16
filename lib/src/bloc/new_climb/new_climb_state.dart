part of 'new_climb_bloc.dart';

enum NewClimbStatus { initial, loading, success, failure }

class NewClimbState extends Equatable {
  const NewClimbState({
    required this.climb,
    this.status = NewClimbStatus.success,
  });

  final Climb climb;
  final NewClimbStatus status;

  NewClimbState copyWith({
    Climb Function()? climb,
    NewClimbStatus Function()? status,
  }) {
    return NewClimbState(
      climb: climb != null ? climb() : this.climb,
      status: status != null ? status() : this.status,
    );
  }

  @override
  List<Object?> get props => [climb, status];
}
