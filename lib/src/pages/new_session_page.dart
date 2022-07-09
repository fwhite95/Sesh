import 'dart:async';

import 'package:climbing_sessions/src/bloc/newClimb/newClimb_bloc.dart';
import 'package:climbing_sessions/src/bloc/newSesh/newSesh_bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/pages/new_climb_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewSessionPage extends StatefulWidget {
  const NewSessionPage({Key? key}) : super(key: key);

  @override
  State<NewSessionPage> createState() => _NewSessionPageState();
}

class _NewSessionPageState extends State<NewSessionPage> {
  Timer? timer;
  late Stopwatch stopwatch;
  String formattedDate = '';
  Sesh currSesh = Sesh(climbs: []);

  @override
  void initState() {
    super.initState();

    //stopwatch = Stopwatch()..start(); Would still use this to track time
    //Need to hook up stopwatch to some kind of state management
    //so that it can constantly update UI (or just use a package)
    DateTime now = DateTime.now();
    formattedDate = DateFormat('kk:mm:ss').format(now);
  }

  void _createNewClimb(context) {
    print('_createNewClimb');
    BlocProvider.of<NewClimbBloc>(context).add(NewClimbRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text('Sesh: 01 Started at: $formattedDate'), //sesh id
        actions: [
          IconButton(
            onPressed: () {
              print('add pressed');
              setState(() {
                //needs to get the returned Climb object
                //from the create climb page
                //newSesh.climbs?.add(Climb());
                //print(newSesh.climbs?.length);
                _createNewClimb(context);
              });
            },
            icon: Icon(
              Icons.add_box,
            ),
            tooltip: 'Add Climb',
          ),
        ],
      ),
      //bottomNavigationBar: SeshBottomNavBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<NewClimbBloc, NewClimbState>(listener: (context, state) {
            if (state is NewClimbRequested) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewClimbPage()));
            }
          }),
        ],
        child:
            BlocBuilder<NewSeshBloc, NewSeshState>(builder: (context, state) {
          if (state is NewSeshInitial) {
            print(state.toString());
            return Container(
              alignment: Alignment.center,
              child: Column(
                //Timer - length of session
                //list of climbs as added
                //Add climb to sesh
                //End sesh button
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  currSesh.climbs!.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: currSesh.climbs?.length ?? 0,
                              itemBuilder: (BuildContext context, index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: ListTile(
                                    title: Text(
                                        'Test of climbs.length: ${currSesh.climbs?.length}'),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.white)),
                                  ),
                                );
                              }))
                      : Container(
                          child: Text('New sesh'),
                        ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      child: Text('End Session'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
