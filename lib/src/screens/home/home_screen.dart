import 'package:carousel_slider/carousel_slider.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:climbing_sessions/src/widgets/sesh_card.dart';
import 'package:climbing_sessions/src/widgets/stat_carousel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
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
          padding: EdgeInsets.all(5),
          child: Column(children: [
            StatCarousel(),
            Container(
              padding: EdgeInsets.all(10),
              child: Text('Recent Seshes', style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColors.darkBlue
              ),),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
              child: Column(
                children: [
                SeshCard(climbsList: [],),
                SizedBox(height: 10,),
                SeshCard(climbsList: [],),
                SizedBox(height: 10,),
                SeshCard(climbsList: [],),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
