import 'package:climbing_sessions/src/screens/authentication/auth_screen.dart';
import 'package:climbing_sessions/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    
  })  : 
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppView();

  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //brightness: Brightness.dark,
      ),
      //themeMode: ThemeMode.dark,
      home: const BlocNavigate(),
    );
  }
}



class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
