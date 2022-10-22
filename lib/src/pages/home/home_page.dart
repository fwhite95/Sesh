import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:climbing_sessions/src/widgets/sesh_card.dart';
import 'package:climbing_sessions/src/widgets/stat_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app/app_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<AppBloc>().add(AppLogoutRequested()),
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
