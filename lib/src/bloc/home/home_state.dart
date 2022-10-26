part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.user,
  });

  final HomeStatus status;
  final UserModel? user;

  HomeState copyWith({
    HomeStatus Function()? status,
    UserModel? Function()? user,
  }) {
    return HomeState(
      status: status != null ? status() : this.status,
      user: user != null ? user() : this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
