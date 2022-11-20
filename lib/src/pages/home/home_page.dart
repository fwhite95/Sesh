import 'package:climbing_sessions/src/bloc/home/home_bloc.dart';
import 'package:climbing_sessions/src/bloc/signup/signup_cubit.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:climbing_sessions/src/widgets/sesh_card.dart';
import 'package:climbing_sessions/src/widgets/stat_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/app/app_bloc.dart';
import '../sesh/sesh_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    print('user from AppBloc: $user');
    return BlocProvider(
        create: (context) => HomeBloc(
              userFbRepository: context.read<UserFbRepository>(),
              user: user,
            )
              ..add(HomeSubscriptionRequested(user)),
        child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((HomeBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<AppBloc>().add(AppNavToNewSeshPageRequested(user));
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const SeshBottomNavBar(),
      body: MultiBlocListener(
        listeners: [
          BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                if (state.status == HomeStatus.failure) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Error retrieving user'),
                      ),
                    );
                }
              }),
        ],
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status != HomeStatus.success) {
              return const SizedBox();
            } else {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(children: [
                    StatCarousel(),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Recent Seshes',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: AppColors.darkBlue),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 10, left: 40, right: 40, bottom: 10),
                      child: Column(children: [
                        for (final sesh in state.user.seshes!)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SeshCard(sesh: sesh),
                          ),
                        
                      ]),
                    ),
                  ]),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
