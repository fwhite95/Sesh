import 'package:climbing_sessions/src/pages/login_signup/login_screen.dart';
import 'package:climbing_sessions/src/pages/login_signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  List<bool> _selections = [true, false];
  int? initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          initialIndex == 0
              ? Container(
                padding: EdgeInsets.all(15),
                  child: LoginScreen(),
                )
              : Container(
                padding: EdgeInsets.all(10),
                  child: SignUpScreen(),
                ),
          ToggleSwitch(
            minWidth: 90.0,
            cornerRadius: 15.0,
            activeBgColor: [Colors.white],
            activeFgColor: Colors.black,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            initialLabelIndex: initialIndex,
            totalSwitches: 2,
            labels: ['Login', 'Register'],
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
}
