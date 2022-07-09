import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:climbing_sessions/src/bloc/newSesh/newSesh_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/pages/completed_sessions_page.dart';
import 'package:climbing_sessions/src/pages/login_signup/login_signup_page.dart';
import 'package:climbing_sessions/src/repositories/auth_repository.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required AuthRepository authRepository,
    required SeshRepository seshRepository,
  })  : _authRepository = authRepository,
        _seshRepository = seshRepository,
        super(key: key);

  final AuthRepository _authRepository;
  final SeshRepository _seshRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: _authRepository),
          RepositoryProvider.value(value: _seshRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthBloc(authRepository: _authRepository, seshRepository: _seshRepository)),
            BlocProvider(create: (context) => SeshBloc(seshRepository: _seshRepository)),
            BlocProvider(create: (context) => NewSeshBloc(seshRepository: _seshRepository)),
          ],
          child: const AppView(),
        )
        // BlocProvider(
        //   create: (_) => AuthBloc(
        //       authRepository: _authRepository, seshRepository: _seshRepository),
        //   child: const AppView(),
        // )
        );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      home: const BlocNavigate(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       themeMode: ThemeMode.dark,
//       home: const BlocNavigate(),
//       // CompletedSessionsPage();
//       // LoginSignupPage();
//       //home: const CompletedSessionsPage(),
//       //home: const NewSessionPage(),
//       //home: const NewClimbPage(),
//     );
//   }
// }

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          print('app state is Authenticated');
          return CompletedSessionsPage(
            userId: state.uuid,
          );
        } else {
          return const LoginSignupPage();
        }
      },
    );
  }
}
