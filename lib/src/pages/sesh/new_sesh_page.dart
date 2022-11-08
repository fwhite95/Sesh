import 'package:climbing_sessions/src/bloc/app/app_bloc.dart';
import 'package:climbing_sessions/src/bloc/new_sesh/new_sesh_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/new_climb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/sesh_model.dart';

class NewSeshPage extends StatelessWidget {
  const NewSeshPage({super.key});

  static Page<void> page() => const MaterialPage(child: NewSeshPage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((SeshBloc bloc) => bloc.state.user);
    print('newSeshPage');
    return BlocProvider(
      create: (context) => NewSeshBloc(
          userFbRepository: context.read<UserFbRepository>(), user: user),
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
  String time = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NewSeshBloc>().add(NewSeshCreateClimbRequested());
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      backgroundColor: AppColors.orange,
      body: BlocListener<NewSeshBloc, NewSeshState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
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
        child: BlocBuilder<NewSeshBloc, NewSeshState>(
          builder: (context, state) {
            if (state.status == NewSeshStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status != NewSeshStatus.success) {
              print('status : ${state.status}');
              return const SizedBox();
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
                                Text('10/07/2022',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              '0000',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                    /// Needs to be sorted by id, or turned from list
                                    /// into a
                                    for (final climb in state.sesh.climbs!)
                                      NewClimbCard(
                                        climb: climb,
                                      ),
                                  ],
                                ),
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
