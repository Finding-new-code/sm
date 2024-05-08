import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp658d7b3746ed317621f8/src/src.dart';
import '../../Pages/AuthPage/View/authpage.dart';
import '../../Pages/HomePage/VIew/homepage.dart';
import '../../Pages/HomePage/widgets/notfication_view.dart';
import '../../Pages/Postcreation/View/postcreation.dart';
import '../../Pages/PremiumPage/premiumpage.dart';
import '../../Pages/SettingsPage/Views/settings_page.dart';
import '../../Pages/WelcomePage/welcome.dart';

final appRoutes = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/auth',
    builder: (context, state) => StreamBuilder(
      stream: servicelocator
          .get<Account>()
          .getSession(sessionId: 'current')
          .asStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const AuthPage();
        }
      },
    ),
  ),
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  ),
  // GoRoute(
  //     path: '/profile',
  //     builder: (context, state) => const ProfilePage(user: user, post: post),
  // ),
  GoRoute(
    path: '/notification',
    builder: (context, state) => const NotificationView(),
  ),
  GoRoute(
    path: '/welcome',
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
    path: '/settings',
    builder: (context, state) => const SettingsPage(),
  ),
  GoRoute(
    path: '/Premium',
    builder: (context, state) => const PremiumPage(),
  ),
  //  GoRoute(
  //     path: '/post',
  //     builder: (context, state) => const PostContainer(post: post, user: user),
  // ),
  GoRoute(
    path: '/create',
    builder: (context, state) => const PostCreationPage(),
  ),
], initialLocation: '/auth');
