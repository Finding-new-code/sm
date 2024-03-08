import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Pages/AuthPage/View/authpage.dart';
import '../../Pages/HomePage/VIew/homepage.dart';
import '../../Pages/WelcomePage/welcome.dart';

final route = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) =>
        const HomePage(isdark: false),
  ),
  GoRoute(
      path: '/auth',
      builder: (BuildContext context, GoRouterState state) => const AuthPage()),
  GoRoute(path: '/welcome', builder: (context, state) => const WelcomePage()),
]);
