import 'package:climbing_sessions/src/bloc/new_climb/new_climb_bloc.dart';
import 'package:climbing_sessions/src/bloc/new_sesh/new_sesh_bloc.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/climb_model.dart';

class NewClimbCard extends StatefulWidget {
  final Climb climb;

  NewClimbCard({Key? key, required Climb climb})
      : this.climb = climb,
        super(key: key);

  @override
  State<NewClimbCard> createState() => _NewClimbCardState();
}

class _NewClimbCardState extends State<NewClimbCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewClimbBloc, NewClimbState>(
      listener: (context, state) {
        if (state.status == NewClimbStatus.success) {
          print('state.climb inside listener: ${state.climb}');
          context
              .read<NewSeshBloc>()
              .add(NewSeshUpdateClimbAttemptsRequested(state.climb));
        }
      },
      child: BlocBuilder<NewClimbBloc, NewClimbState>(
        buildWhen: (previous, current) => previous.climb != current.climb,
        builder: (context, state) {
          if (state.status == NewClimbStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status != NewClimbStatus.success) {
            return SizedBox();
          } else {
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  color: AppColors.orange,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Column(
                children: [
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Climb: #${widget.climb.climbId}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: DropdownButton<String>(
                          value: state.climb.grade,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          underline: Container(
                            height: 1,
                            color: Colors.black,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            context
                                .read<NewClimbBloc>()
                                .add(NewClimbUpdateGradeRequested(value!));
                          },
                          items: vGrade
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:
                            Text('Attempts: ', style: TextStyle(fontSize: 16)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: IconButton(
                            onPressed: () {
                              final val = state.climb.attempts! - 1;
                              if (val > 0) {
                                context
                                    .read<NewClimbBloc>()
                                    .add(NewClimbUpdateAttemptsRequested(val));
                              }
                            },
                            icon: Icon(Icons.remove)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(widget.climb.attempts.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: IconButton(
                            onPressed: () {
                              final val = state.climb.attempts! + 1;
                              context
                                  .read<NewClimbBloc>()
                                  .add(NewClimbUpdateAttemptsRequested(val));
                            },
                            icon: Icon(Icons.add)),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Completed: ', style: TextStyle(fontSize: 16)),
                      Checkbox(
                          value: state.climb.completed ?? false,
                          onChanged: (value) {
                            context
                                .read<NewClimbBloc>()
                                .add(NewClimbUpdateCompletedRequested(value!));
                          }),
                    ],
                  ),
                ),
              ]),
            );
          }
        },
      ),
    );
  }
}
