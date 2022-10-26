import 'package:climbing_sessions/src/repository/auth_repository.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../bloc/login/login_cubit.dart';
import '../../bloc/signup/signup_cubit.dart';
import 'login_page.dart';
import 'signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: AuthPage());

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 5, left: 15, right: 15),
                      child: BlocProvider(
                        create: (_) => LoginCubit(
                            context.read<AuthenticationRepository>()),
                        child: LoginPage(),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.all(10),
                      child: BlocProvider(
                        create: (_) => SignupCubit(
                            context.read<AuthenticationRepository>(),
                            context.read<UserFbRepository>()),
                        child: SignupPage(),
                      ),
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
