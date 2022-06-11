import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      //if email is valid, adding new Event [SignInRequested]
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_nameController.text, _emailController.text,
            _passwordController.text),
      );
    }
  }

  void _createUserAfterSignUp(context) {
    BlocProvider.of<AuthBloc>(context)
        .add(CreateUserRequested(_nameController.text, _emailController.text));
  }

  bool isEmail(String? value) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(regex);

    return value!.isNotEmpty && regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        child: Container(
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
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'First Name'),
                  validator: (value) =>
                      value!.isEmpty ? 'First name cannot be empty' : null,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Email'),
                  validator: (value) => !isEmail(value)
                      ? 'Sorry, we do not recognize that email address'
                      : null,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 6) {
                      return 'Must be more then 5 characters';
                    }
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  controller: _passwordConfirmController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords don\'t match';
                    }
                    if (value!.isEmpty) {
                      return 'Please confirm password';
                    }
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authenticateWithEmailAndPassword(context);
                    }
                    _createUserAfterSignUp(context);
                  },
                  child: Text('Register'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepPurpleAccent),
                    minimumSize: MaterialStateProperty.all<Size>(Size(180, 40)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
