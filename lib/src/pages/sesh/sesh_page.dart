import 'package:climbing_sessions/src/bloc/app/app_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/pages/sesh/new_sesh_page.dart';
import 'package:climbing_sessions/src/repository/user_repository.dart';
import 'package:climbing_sessions/src/util/colors.dart';
import 'package:climbing_sessions/src/widgets/sesh_bottom_nav_bar.dart';
import 'package:climbing_sessions/src/widgets/sesh_card.dart';
import 'package:climbing_sessions/src/widgets/stat_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';

class SeshPage extends StatelessWidget {
  const SeshPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SeshPage());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    print('user $user');
    return BlocProvider(
      create: (context) => SeshBloc(
          userFbRepository: context.read<UserFbRepository>(), user: user)
        ..add(SeshUserSubscriptionRequested(user)),
      child: const SeshView(),
    );
  }
}

class SeshView extends StatefulWidget {
  const SeshView({Key? key}) : super(key: key);

  @override
  State<SeshView> createState() => _SeshViewState();
}

class _SeshViewState extends State<SeshView> {
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
        onPressed: () {
          /// Navigate to [NewSeshPage]
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const NewSeshPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: SeshBottomNavBar(),
      body: BlocListener<SeshBloc, SeshState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == SeshStatus.failure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Error retrieving seshes'),
                ),
              );
          }
        },
        child: BlocBuilder<SeshBloc, SeshState>(
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status != SeshStatus.success) {
              return const SizedBox();
            } else if (state.status == SeshStatus.success &&
                state.user.seshes == null) {
              return Center(
                child: Text('Create a sesh to get started'),
              );
            } else {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: state.user.seshes!.isEmpty
                      ? Center(
                          child: Text('Create a sesh to get started'),
                        )
                      : Column(
                          children: [
                            for (final sesh in state.user.seshes!)
                              SeshCard(sesh: sesh),
                          ],
                        ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
