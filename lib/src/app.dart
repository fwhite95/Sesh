import 'package:climbing_sessions/src/bloc/home/home_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/repository/auth_repository.dart';
import 'package:climbing_sessions/src/pages/authentication/auth_page.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app/app_bloc.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required UserFbRepository userFbRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userFbRepository = userFbRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final UserFbRepository _userFbRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _userFbRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (_) => HomeBloc(
              userFbRepository: _userFbRepository,
              user: UserModel.empty,
            ),
          ),
          BlocProvider(
            create: (_) => SeshBloc(
              userFbRepository: _userFbRepository,
              user: UserModel.empty
            ),
          ),
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateViewPages,
      ),
    );
  }
}

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthPage();
  }
}
