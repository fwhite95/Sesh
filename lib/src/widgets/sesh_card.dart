import 'package:climbing_sessions/src/models/climb_model.dart';
import 'package:climbing_sessions/src/models/sesh_model.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';

class SeshCard extends StatelessWidget {
  final Sesh _sesh;

  SeshCard({Key? key, required Sesh sesh})
      : _sesh = sesh,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
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
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Sesh: ${_sesh.id}',
                style: TextStyle(fontSize: 16),
              ),
              Text(_sesh.dateTime!,
                  style: TextStyle(fontSize: 16)),
              Text('00:00:00', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
        _sesh.climbs!.length < 5
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (final climb in _sesh.climbs!)
                    ClimbCard(
                      climbName: climb.climbId.toString(),
                      grade: climb.grade.toString(),
                      attempts: climb.attempts.toString(),
                    )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    ClimbCard(
                      climbName: _sesh.climbs![i].climbId.toString(),
                      grade: _sesh.climbs![i].grade.toString(),
                      attempts: _sesh.climbs![i].attempts.toString(),
                    )
                ],
              ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ]),
    );
  }
}

class ClimbCard extends StatelessWidget {
  ClimbCard(
      {Key? key,
      required String climbName,
      required String grade,
      required String attempts})
      : _climbName = climbName,
        _grade = grade,
        _attempts = attempts,
        super(key: key);

  final String _climbName;
  final String _grade;
  final String _attempts;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Climb: $_climbName'),
            SizedBox(
              width: 15,
            ),
            Text('Grade: $_grade'),
            SizedBox(
              width: 15,
            ),
            Text('Attempts: $_attempts'),
          ],
        ));
  }
}
