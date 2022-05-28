import 'package:climbing_sessions/src/pages/completed_sessions_page.dart';
import 'package:climbing_sessions/src/pages/login_signup/login_signup_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      //home: const LoginSignupPage(),
      home: const CompletedSessionsPage(),
    );
  }
}