import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/util/constants.dart';
import 'package:flutter/material.dart';

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

  String dropdownValue = vGrade.first;

  @override
  Widget build(BuildContext context) {
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
      child: Column(children: [
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
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: vGrade.map<DropdownMenuItem<String>>((String value) {
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
                child: Text('Attempts: ', style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(widget.climb.attempts.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
