import 'package:flutter/material.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/AuthPage/View/authdesktop.dart';
import 'package:myapp658d7b3746ed317621f8/Pages/AuthPage/View/authmobile.dart';
import 'package:myapp658d7b3746ed317621f8/components/responsive.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        desktoptype: AuthdesktopView(),
        tablettype: AuthdesktopView(),
        mobiletype: AuthMobile());
  }
}
