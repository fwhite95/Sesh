import 'dart:async';

import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class NewClimbPage extends StatefulWidget {
  const NewClimbPage({Key? key}) : super(key: key);

  @override
  State<NewClimbPage> createState() => _NewClimbPageState();
}

class _NewClimbPageState extends State<NewClimbPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.deepPurpleAccent;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('New Climb'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Grade: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('0'),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ), //grade
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Attempts: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('0'),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Completed: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ]),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
