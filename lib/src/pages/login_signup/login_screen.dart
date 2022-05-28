import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(15),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Name'),
            ),
          ),
          Container(
            child: TextField(
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
              onPressed: () {},
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
    );
  }
}
