import 'package:climbing_sessions/src/bloc/app/app_bloc.dart';
import 'package:climbing_sessions/src/bloc/sesh/sesh_bloc.dart';
import 'package:climbing_sessions/src/pages/authentication/auth_page.dart';
import 'package:climbing_sessions/src/pages/sesh/new_sesh_page.dart';
import 'package:climbing_sessions/src/pages/sesh/sesh_page.dart';
import 'package:flutter/widgets.dart';

import '../pages/home/home_page.dart';

List<Page<dynamic>> onGenerateViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [AuthPage.page()];
    case AppStatus.sesh:
      return [SeshPage.page()];
    case AppStatus.home:
      return [HomePage.page()];
    case AppStatus.newSesh:
      return [NewSeshPage.page()];
  }
}
