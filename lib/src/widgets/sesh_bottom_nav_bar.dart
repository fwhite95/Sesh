import 'package:climbing_sessions/src/bloc/app/app_bloc.dart';
import 'package:climbing_sessions/src/bloc/home/home_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/pages/home/home_page.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import '../pages/sesh/sesh_page.dart';
import '../repository/user_repository.dart';

class SeshBottomNavBar extends StatelessWidget {
  const SeshBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //late UserModel user;
    return BottomAppBar(
      color: AppColors.green,
      shape: CircularNotchedRectangle(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) async {
              }),
          BlocListener<SeshBloc, SeshState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
              }),
        ],
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => HomePage()));
                    context
                        .read<AppBloc>()
                        .add(AppNavToHomePageRequested(state.user));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) => SeshPage()));
                    context
                        .read<AppBloc>()
                        .add(AppNavToSeshPageRequested(state.user));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.stacked_bar_chart,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Padding(
                  padding: EdgeInsets.only(right: 90),
                  child: IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
