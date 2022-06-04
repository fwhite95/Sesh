import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authenticateWithEmailAndPassword(context) {
    //if (_formKey.currentState!.validate()) {
    // If email is valid adding new Event [SignInRequested].
    BlocProvider.of<AuthBloc>(context).add(
      SignInRequested(_emailController.text, _passwordController.text),
    );
    //}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Have an account?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login Here',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Email'),
              ),
            ),
            Container(
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Password'),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  _authenticateWithEmailAndPassword(context);
                },
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
                ),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot your password?'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
