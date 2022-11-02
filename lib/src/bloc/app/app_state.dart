part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
  sesh,
  home,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = UserModel.empty,
  });

  const AppState.authenticated(UserModel user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  AppState copyWith({
    AppStatus Function()? status,
    UserModel Function()? user,
  }) {
    return AppState._(
      status: status != null ? status() : this.status,
      user: user != null ? user() : this.user,
    );
  }

  final AppStatus status;
  final UserModel user;

  @override 
  List<Object> get props => [status, user];
}
