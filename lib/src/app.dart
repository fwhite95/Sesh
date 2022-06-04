import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:climbing_sessions/src/pages/completed_sessions_page.dart';
import 'package:climbing_sessions/src/pages/login_signup/login_signup_page.dart';
import 'package:climbing_sessions/src/pages/new_climb_page.dart';
import 'package:climbing_sessions/src/pages/new_session_page.dart';
import 'package:climbing_sessions/src/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.dark,
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CompletedSessionsPage();
              }
              return const LoginSignupPage();
            },
          ),

          //home: const CompletedSessionsPage(),
          //home: const NewSessionPage(),
          //home: const NewClimbPage(),
        ),
      ),
    );
  }
}
