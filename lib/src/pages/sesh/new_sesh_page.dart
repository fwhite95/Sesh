import 'package:climbing_sessions/src/bloc/app/app_bloc.dart';
import 'package:climbing_sessions/src/bloc/new_climb/new_climb_bloc.dart';
import 'package:climbing_sessions/src/bloc/new_sesh/new_sesh_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/new_climb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../models/sesh_model.dart';

class NewSeshPage extends StatelessWidget {
  const NewSeshPage({super.key});

  static Page<void> page() => const MaterialPage(child: NewSeshPage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => NewSeshBloc(
          userFbRepository: context.read<UserFbRepository>(), user: user)
        ..add(NewSeshStarted()),
      child: const NewSeshView(),
    );
  }
}

class NewSeshView extends StatefulWidget {
  const NewSeshView({Key? key}) : super(key: key);

  @override
  State<NewSeshView> createState() => _NewSeshViewState();
}

class _NewSeshViewState extends State<NewSeshView> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(); //Create instance

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((NewSeshBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              context.read<AppBloc>().add(AppNavToHomePageRequested(user));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NewSeshBloc>().add(NewSeshCreateClimbRequested());
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      backgroundColor: AppColors.orange,
      body: MultiBlocListener(
        listeners: [
          BlocListener<NewSeshBloc, NewSeshState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) async {
              if (state.status == NewSeshStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text('Error retrieving user'),
                    ),
                  );
              }
            },
          ),
        ],
        child: BlocBuilder<NewSeshBloc, NewSeshState>(
          builder: (context, state) {
            if (state.status == NewSeshStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sesh #1', style: TextStyle(fontSize: 16)),
                                Text(state.sesh.dateTime ?? '',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          StreamBuilder<int>(
                            stream: _stopWatchTimer.rawTime,
                            builder: (context, snap) {
                              final value = snap.data;
                              final displayTime =
                                  StopWatchTimer.getDisplayTime(value ?? 0);
                              return Container(
                                padding: EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    if (_stopWatchTimer.isRunning) {
                                      _stopWatchTimer.onStopTimer();
                                    } else {
                                      _stopWatchTimer.onStartTimer();
                                    }
                                  },
                                  child: Text(
                                    displayTime,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)),
                          color: Colors.white,
                        ),
                        child: state.sesh.climbs!.isEmpty
                            ? Center(
                                child: Text('Start a new climb for this sesh!'),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (final climb
                                        in state.sesh.climbs!)
                                      BlocProvider(
                                        create: (context) =>
                                            NewClimbBloc(initialClimb: climb),
                                        child: NewClimbCard(
                                          climb: climb,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        child: Text('Finish Sesh'),
                        onPressed: () async {
                          _stopWatchTimer.onStopTimer();
                          final val = StopWatchTimer.getDisplayTime(
                              _stopWatchTimer.rawTime.value);
                          context
                              .read<NewSeshBloc>()
                              .add(NewSeshSaveSeshRequested(state.user, val));
                          context
                              .read<AppBloc>()
                              .add(AppNavToHomePageRequested(state.user));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: AppColors.green,
                          minimumSize: Size(180, 40),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
