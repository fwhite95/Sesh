import 'package:climbing_sessions/src/app.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';

import '../../models/climb_model.dart';
import '../../models/sesh_model.dart';

class SeshDetailScreen extends StatelessWidget {
  final Sesh _sesh;

  SeshDetailScreen({Key? key, required Sesh sesh})
      : _sesh = sesh,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
        title: Text('Sesh Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ClimbListingCard(climbs: _sesh.climbs!),
          ],
        ),
      ),
    );
  }
}

class ClimbListingCard extends StatelessWidget {
  final List<Climb> _climbs;

  ClimbListingCard({Key? key, required List<Climb> climbs})
      : _climbs = climbs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          labelRow(),
          for (final climb in _climbs) climbRow(climb),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget labelRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text('Climb ID', style: TextStyle(fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text('Grade', style: TextStyle(fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text('# of Attempts', style: TextStyle(fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              child: Text('Completed?', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  Widget climbRow(Climb climb) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
            top: BorderSide(),
            left: BorderSide(),
            right: BorderSide(),
            bottom: BorderSide(),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(climb.climbId.toString()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(climb.grade ?? ''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text(climb.attempts.toString()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text((climb.completed != null ? climb.completed : false)
                  .toString()),
            ),
          ),
        ],
      ),
    );
  }
}
