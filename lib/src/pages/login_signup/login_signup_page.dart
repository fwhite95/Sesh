import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:climbing_sessions/src/pages/completed_sessions_page.dart';
import 'package:climbing_sessions/src/pages/login_signup/login_screen.dart';
import 'package:climbing_sessions/src/pages/login_signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final List<bool> _selections = [true, false];
  int? initialIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocListener<AuthBloc, AuthState>(listener: (context, state) {
        if (state is Authenticated) {
          //navigating to the home screen is user is authenticated
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const CompletedSessionsPage()));
        }
        if (state is AuthError) {
          //show error message
          print('state is AuthError: $AuthError');
        }
      }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UnAuthenticated) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                initialIndex == 0
                    ? Container(
                        padding: const EdgeInsets.all(15),
                        child: const LoginScreen(),
                      )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        child: const SignUpScreen(),
                      ),
                ToggleSwitch(
                  minWidth: 90.0,
                  cornerRadius: 15.0,
                  activeBgColor: const [Colors.white],
                  activeFgColor: Colors.black,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  initialLabelIndex: initialIndex,
                  totalSwitches: 2,
                  labels: const ['Login', 'Register'],
                  radiusStyle: true,
                  onToggle: (index) {
                    setState(() {
                      initialIndex = index;
                    });
                  },
                ),
              ],
            ),
          );
        }
        return Container();
      })),
    );
  }
}
