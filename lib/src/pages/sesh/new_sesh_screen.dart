import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/new_climb_card.dart';
import 'package:flutter/material.dart';

class NewSeshScreen extends StatefulWidget {
  const NewSeshScreen({Key? key}) : super(key: key);

  @override
  State<NewSeshScreen> createState() => _NewSeshScreenState();
}

class _NewSeshScreenState extends State<NewSeshScreen> {
  final stopwatch = Stopwatch();
  String time = '';

  @override
  void initState() {
    super.initState();
    //stopwatch.start();
  }

  String updateTime() {
    setState(() {
      time = stopwatch.elapsed.toString();
    });
    return time;
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
          setState(() {
            if (stopwatch.isRunning) {
              stopwatch.stop();
            } else {
              stopwatch.start();
            }
          });
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      backgroundColor: AppColors.orange,
      body: Container(
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
                        Text('10/07/2022', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      updateTime(),
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    NewClimbCard(seshId: '1', grade: 'V5',),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
