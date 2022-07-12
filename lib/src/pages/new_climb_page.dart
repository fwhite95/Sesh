import 'dart:async';

import 'package:climbing_sessions/src/bloc/newClimb/newClimb_bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void _incGrade(context, Climb currClimb) {
    BlocProvider.of<NewClimbBloc>(context)
        .add(IncNewClimbGradeRequested(currClimb));
  }

  void _decGrade(context, Climb currClimb) {
    BlocProvider.of<NewClimbBloc>(context)
        .add(DecNewClimbGradeRequested(currClimb));
  }

  void _incAttempts(context, Climb currClimb) {
    BlocProvider.of<NewClimbBloc>(context)
        .add(IncNewClimbAttemptsRequested(currClimb));
  }

  void _decAttempts(context, Climb currClimb) {
    BlocProvider.of<NewClimbBloc>(context)
        .add(DecNewClimbAttemptsRequested(currClimb));
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<NewClimbBloc, NewClimbState>(
            listener: (context, state) {},
          ),
        ],
        child: BlocBuilder<NewClimbBloc, NewClimbState>(
          builder: (context, state) {
            if (state is NewClimbLoading) {
              //return CircularProgressIndicator();
            }

            if (state is NewClimbInitial) {
              return Container(
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
                                  onPressed: () {
                                    _decGrade(context, state.climb);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(state.climb.grade.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    _incGrade(context, state.climb);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ), //grade
                      SizedBox(
                        height: 30,
                      ),
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
                                  onPressed: () {
                                    _decAttempts(context, state.climb);
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(state.climb.attempts.toString()),
                                SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    _incAttempts(context, state.climb);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
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
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: state.climb.completed,
                                onChanged: (bool? value) {
                                  setState(() {
                                    state.climb.completed = value;
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
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
