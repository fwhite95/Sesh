import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:climbing_sessions/src/widgets/sesh_card.dart';
import 'package:climbing_sessions/src/widgets/stat_carousel.dart';
import 'package:flutter/material.dart';

class SeshScreen extends StatefulWidget {
  const SeshScreen({Key? key}) : super(key: key);

  @override
  State<SeshScreen> createState() => _SeshScreenState();
}

class _SeshScreenState extends State<SeshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
        title: Container(
          width: double.infinity,
          color: Colors.white,
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a Sesh',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: SeshBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SeshCard(climbsList: []),
              SizedBox(
                height: 15,
              ),
              SeshCard(climbsList: []),
              SizedBox(
                height: 15,
              ),
              SeshCard(climbsList: []),
            ],
          ),
        ),
      ),
    );
  }
}
