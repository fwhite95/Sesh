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
import '../../bloc/sesh_card/sesh_card_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    return const SettingsView();
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      ),
    );
  }
}