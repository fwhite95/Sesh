import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authenticateWithEmailAndPassword(context) {
    if(_formKey.currentState!.validate()) {
    //if email is valid, adding new Event [SignInRequested]
    BlocProvider.of<AuthBloc>(context).add(
      SignUpRequested(_emailController.text, _passwordController.text),
    );
    }
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
                'No account?',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Register now',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'First Name'),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Last Name'),
                    ),
                  ),
                ],
              ),
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
            Container(
              child: TextField(
                controller: _passwordConfirmController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password'),
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
                child: Text('Register'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepPurpleAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
