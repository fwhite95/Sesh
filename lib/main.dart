import 'package:climbing_sessions/src/app.dart';
import 'package:climbing_sessions/src/bloc/app_bloc_observer.dart';
import 'package:climbing_sessions/src/repository/auth_repository.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;

      final userFbRepository = UserFbRepository();
      runApp(App(
        authenticationRepository: authenticationRepository,
        userFbRepository: userFbRepository,
      ));
    },
    blocObserver: AppBlocObserver(),
  );
}
