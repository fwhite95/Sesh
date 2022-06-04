import 'dart:async';

import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
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
  Sesh newSesh = Sesh(climbs: []);

  @override
  void initState() {
    super.initState();

    //stopwatch = Stopwatch()..start(); Would still use this to track time
    //Need to hook up stopwatch to some kind of state management
    //so that it can constantly update UI (or just use a package)
    DateTime now = DateTime.now();
    formattedDate = DateFormat('kk:mm:ss').format(now);
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
                newSesh.climbs?.add(Climb());
                print(newSesh.climbs?.length);
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
      body: Container(
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
            !newSesh.climbs!.isEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: newSesh.climbs?.length ?? 0,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: ListTile(
                              title: Text(
                                  'Test of climbs.length: ${newSesh.climbs?.length}'),
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.white)),
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
      ),
    );
  }
}
