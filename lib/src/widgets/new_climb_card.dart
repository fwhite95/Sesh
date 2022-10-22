import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';

class NewClimbCard extends StatefulWidget {
  final String seshId;
  final String grade;

  NewClimbCard({Key? key, required String seshId, required String grade})
      : this.seshId = seshId,
        this.grade = grade,
        super(key: key);

  @override
  State<NewClimbCard> createState() => _NewClimbCardState();
}

class _NewClimbCardState extends State<NewClimbCard> {
  String attempts = '1';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    attempts = '1';
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
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Sesh: #${widget.seshId}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Grade: ${widget.grade}', style: TextStyle(fontSize: 16)),
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
                child: Text(attempts, style: TextStyle(fontWeight: FontWeight.bold)),
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
