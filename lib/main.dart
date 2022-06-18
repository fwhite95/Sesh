import 'package:climbing_sessions/src/app.dart';
import 'package:climbing_sessions/src/bloc/app_bloc_observer.dart';
import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/repositories/auth_repository.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () => runApp(
      MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: AuthRepository())),
        BlocProvider(create: (context) => SeshBloc(seshRepository: SeshRepository())),
        //BlocProvider(create: (context) => DatabaseBloc(DatabaseRepository())),
      ], child: const MyApp()),
    ),
    blocObserver: AppBlocObserver(),
  );
}
