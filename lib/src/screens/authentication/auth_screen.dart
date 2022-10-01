import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'login_screen.dart';
import 'signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int? initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  'Sesh',
                  style: TextStyle(fontSize: 62),
                ),
              ),
              initialIndex == 0
                  ? Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
                      child: const LoginScreen(),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: const SignupScreen(),
                    ),
              ToggleSwitch(
                minWidth: 90.0,
                cornerRadius: 15.0,
                activeBgColor: [AppColors.orange],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: initialIndex,
                totalSwitches: 2,
                labels: const ['Login', 'Signup'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    initialIndex = index;
                  });
                },
              ),
            ]),
      ),
    );
  }
}
