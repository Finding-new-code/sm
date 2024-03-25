import 'package:go_router/go_router.dart';
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
    builder: (context, state) => const AuthPage(),
  ),
  GoRoute(
    path: '/home',
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
  ), GoRoute(
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
]);
