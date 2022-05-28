import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        border: OutlineInputBorder(), labelText: 'First Name'),
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              obscureText: true,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Confirm Password'),
              obscureText: true,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {},
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
    );
  }
}
