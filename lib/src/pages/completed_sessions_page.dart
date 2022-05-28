import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CompletedSessionsPage extends StatefulWidget {
  const CompletedSessionsPage({Key? key}) : super(key: key);

  @override
  State<CompletedSessionsPage> createState() => _CompletedSessionsPageState();
}

class _CompletedSessionsPageState extends State<CompletedSessionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Sessions'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add new sesh',
        child: Icon(Icons.add_box),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SeshBottomNavBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              onDoubleTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //border: Border.all(color: Colors.white),
                    color: Color.fromARGB(255, 41, 22, 49),
                    boxShadow: [
                      BoxShadow(blurStyle: BlurStyle.outer),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        'Sesh $index 05/22',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text('Climbs completed: ${10 + index}'),
                            alignment: Alignment.center,
                            height: 50,
                            width:
                                150, //width needs to size dynamically to phone
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple,
                            ),
                          ),
                          Container(
                            child: Text('Average grade: V5'),
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text('Total attempts: 20'),
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          Container(
                            child: Text('Total time: 1hr 35min'),
                            alignment: Alignment.center,
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}