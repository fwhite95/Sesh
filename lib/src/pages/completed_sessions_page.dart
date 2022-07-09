import 'package:climbing_sessions/src/bloc/auth/auth_bloc.dart' as auth;
import 'package:climbing_sessions/src/bloc/newSesh/newSesh_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/models/user_model.dart';
import 'package:climbing_sessions/src/pages/login_signup/login_signup_page.dart';
import 'package:climbing_sessions/src/pages/new_session_page.dart';
import 'package:climbing_sessions/src/repositories/sesh_repository.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as dev;

class CompletedSessionsPage extends StatefulWidget {
  final String? userId;
  const CompletedSessionsPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<CompletedSessionsPage> createState() => _CompletedSessionsPageState();
}

class _CompletedSessionsPageState extends State<CompletedSessionsPage> {
  late UserModel userModel;

  @override
  void initState() {
    super.initState();
  }

  void _getSeshes(context) {
    print('getSeshes called: ');
    BlocProvider.of<SeshBloc>(context)
        .add(SeshesRequested(widget.userId));
  }

  void _createNewSesh(context, UserModel userModel) {
    print('_createNewSesh');
    //dev.log(userModel.toString());
    BlocProvider.of<NewSeshBloc>(context).add(NewSeshRequested(userModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Sessions'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNewSesh(context, userModel);
        },
        tooltip: 'Add new sesh',
        child: Icon(Icons.add_box),
        elevation: 4.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SeshBottomNavBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<auth.AuthBloc, auth.AuthState>(
              listener: ((context, state) {
            if (state is auth.UnAuthenticated) {
              //navigate to sign in screen
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginSignupPage()),
                  (route) => false);
            }
            if (state is auth.Authenticated) {
              print('state.uuid inside listeners: ${state.uuid}');
              print('state is auth.Authenticated????');
              _getSeshes(context);
            }
          })),
          BlocListener<SeshBloc, SeshState>(listener: (context, state) {
            if (state is SeshInitial) {
              print('state is SeshInitial');
              _getSeshes(context);
            }
          }),
          BlocListener<NewSeshBloc, NewSeshState>(listener: (context, state) {
            if (state is NewSeshInitial) {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => NewSessionPage()));
                  
            }
          }),
        ],
        child: BlocBuilder<SeshBloc, SeshState>(
          builder: (context, state) {
            if (state is Loading) {
              print('blocBuilder sesh is loading');
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SeshInitial) {
              print('blocBuilder sesh is SeshInitial: ${widget.userId}');
              
              _getSeshes(context);
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is Browsing) {
              userModel = state.userModel;
              print('state is Browsing');
              print(state.userModel.firstName);
              return ListView.builder(
                  itemCount: state.userModel.seshes?.length ?? 0,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onDoubleTap: () {},
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
                                'Sesh $index ${state.userModel.seshes?[index].dateTime.toString()}',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(bottom: 5, left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text(
                                        'Climbs completed: ${state.userModel.seshes?[index].climbsCompleted}'),
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
                                    child: Text(
                                        'Average grade: ${state.userModel.seshes?[index].averageGrade}'),
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
                              padding:
                                  EdgeInsets.only(bottom: 5, left: 5, right: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Text(
                                        'Total attempts: ${state.userModel.seshes?[index].totalAttempts}'),
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
                  });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
